//
//  ContentView.swift
//  CombineCoreLocationManager
//
//  Created by Giordano Scalzo on 28/07/2021.
//

import SwiftUI
import CoreLocation
import Combine

class LocationManager: NSObject {
    enum LocationError: String, Error {
        case restricted
        case denied
        case unknown
    }
    
    let statusPublisher = PassthroughSubject<CLAuthorizationStatus, LocationError>()
    let locationPublisher = PassthroughSubject<CLLocation?, Never>()
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    func start() {
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .restricted:
            statusPublisher.send(completion: .failure(.restricted))
        case .denied:
            statusPublisher.send(completion: .failure(.denied))
        case .notDetermined, .authorizedAlways, .authorizedWhenInUse:
            statusPublisher.send(manager.authorizationStatus)
        @unknown default:
            statusPublisher.send(completion: .failure(.unknown))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        locationPublisher.send(location)
    }
}

class LocationViewModel: ObservableObject {
    @Published private var status: CLAuthorizationStatus = .notDetermined
    @Published private var currentLocation: CLLocation?
    @Published var errorMessage = ""
    
    private let locationManager = LocationManager()
    
    var thereIsAnError: Bool {
        !errorMessage.isEmpty
    }
    
    var latitude: String {
        currentLocation.latitudeDescription
    }
    
    var longitude: String {
        currentLocation.longitudeDescription
    }
    
    var statusDescription: String {
        switch status {
        case .notDetermined:
            return "notDetermined"
        case .authorizedWhenInUse:
            return "authorizedWhenInUse"
        case .authorizedAlways:
            return "authorizedAlways"
        case .restricted:
            return "restricted"
        case .denied:
            return "denied"
        @unknown default:
            return "unknown"
        }
    }
    
    func startUpdating() {
        locationManager.start()
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        locationManager.statusPublisher
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.rawValue
                }
            } receiveValue: { self.status = $0}
            .store(in: &cancellableSet)
        
        locationManager.locationPublisher
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates(by: lessThanOneMeter)
            .assign(to: \.currentLocation, on: self)
            .store(in: &cancellableSet)
    }
    
    private func lessThanOneMeter(_ lhs: CLLocation?, _ rhs: CLLocation?) -> Bool {
        if lhs == nil && rhs == nil {
            return true
        }
        guard let lhs, let rhs else {
            return false
        }
        return lhs.distance(from: rhs) < 1
    }
}

extension Optional where Wrapped == CLLocation {
    var latitudeDescription: String {
        guard let latitude = self?.coordinate.latitude else { return "-" }
        return String(format: "%.4f", latitude)
    }
    
    var longitudeDescription: String {
        guard let longitude = self?.coordinate.longitude else { return "-" }
        return String(format: "%.4f", longitude)
    }
}

struct ContentView: View {
    @StateObject var locationViewModel = LocationViewModel()
    
    var body: some View {
        Group {
            if locationViewModel.thereIsAnError {
                Text("Location Service terminated with error: \(locationViewModel.errorMessage)")
            } else {
                Text("Status: \(locationViewModel.statusDescription)")
                HStack {
                    Text("Latitude: \(locationViewModel.latitude)")
                    Text("Longitude: \(locationViewModel.longitude)")
                }
            }
        }
        .padding(.horizontal, 24)
        .task {
            locationViewModel.startUpdating()
        }
    }
}

#Preview {
    ContentView()
}

//
//  CustomRowsApp.swift
//  CustomRows
//
//  Created by Juan Catalan on 5/4/23.
//

import SwiftUI

@main
struct CustomRowsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(weatherData: WeatherInfo.weatherData)
        }
    }
}

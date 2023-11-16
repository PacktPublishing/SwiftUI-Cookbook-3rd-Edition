//
//  CityClimate.swift
//  ChartCustomizations
//
//  Created by Juan Catalan on 9/6/23.
//

import Foundation

struct ClimateData {
    let date: Date
    let rainfall: Measurement<UnitLength>
    let maxTemperature: Measurement<UnitTemperature>
    let minTemperature: Measurement<UnitTemperature>
}

extension ClimateData: Decodable {
    enum CodingKeys: String, CodingKey {
        case date = "month"
        case rainfall
        case maxTemperature = "high"
        case minTemperature = "low"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(Date.self, forKey: .date)
        rainfall = try Measurement(
            value: container.decode(Double.self, forKey: .rainfall),
            unit: .millimeters
        )
        maxTemperature = try Measurement(
            value: container.decode(Double.self, forKey: .maxTemperature),
            unit: .celsius
        )
        minTemperature = try Measurement(
            value: container.decode(Double.self, forKey: .minTemperature),
            unit: .celsius
        )
    }
}

struct CityClimate: Decodable {
    let city: String
    let climate: [ClimateData]
}

extension CityClimate {
    var year: Int {
        Calendar.current.dateComponents([.year], from: climate[0].date).year!
    }
    var averageRainfall: Measurement<UnitLength> {
        let initial = Measurement(value: 0, unit: UnitLength.meters)
        let average = climate.map { $0.rainfall.converted(to: .meters) }.reduce(initial, +) / Double(climate.count)
        return average
    }
}

extension CityClimate {
    static var sample: [CityClimate] = {
        guard let url = Bundle.main.url(forResource: "climate_data", withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else {
            return []
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM-yy"
        let decoder  = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        let array = try? decoder.decode([CityClimate].self, from: data)
        return array ??  []
    }()
}

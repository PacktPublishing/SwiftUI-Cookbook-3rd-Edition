//
//  CityClimate.swift
//  IntroducingSwiftCharts
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
        let average = climate.map {
            $0.rainfall.converted(to: .meters)
        }.reduce(initial, +) / Double(climate.count)
        return average
    }
    var averageLow: Measurement<UnitTemperature> {
        let initial = Measurement(value: 0, unit: UnitTemperature.celsius)
        let average = climate.map {
            $0.minTemperature.converted(to: .celsius)
        }.reduce(initial, +) / Double(climate.count)
        return average
    }
    var averageHigh: Measurement<UnitTemperature> {
        let initial = Measurement(value: 0, unit: UnitTemperature.celsius)
        let average = climate.map {
            $0.maxTemperature.converted(to: .celsius)
        }.reduce(initial, +) / Double(climate.count)
        return average
    }
    var highestRainfallMonth: ClimateData {
        let initial = climate[0]
        let month = climate.reduce(initial) { partial, result in
            partial.rainfall > result.rainfall ? partial : result
        }
        return month
    }
    var highestTemperatureMonth: ClimateData {
        let initial = climate[0]
        let month = climate.reduce(initial) { partial, result in
            partial.maxTemperature > result.maxTemperature ? partial : result
        }
        return month
    }
    var lowestTemperatureMonth: ClimateData {
        let initial = climate[0]
        let month = climate.reduce(initial) { partial, result in
            partial.minTemperature <= result.minTemperature ? partial : result
        }
        return month
    }
}

extension CityClimate {
    static var sample: [CityClimate] = {
        guard let url = Bundle.main.url(forResource: "climate_data", withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else {
            return []
        }
        let json = String(data: data, encoding: .utf8)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM-yy"
        let decoder  = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        let array = try? decoder.decode([CityClimate].self, from: data)
        return array ??  []
    }()
}

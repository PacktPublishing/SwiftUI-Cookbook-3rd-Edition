//
//  City.swift
//  MultiColumnTable
//
//  Created by Juan Catalan on 5/19/23.
//

import Foundation

struct City: Identifiable {
    var name: String
    var state: String
    var population: Int
    var area: Measurement<UnitArea>
    // Identifiable
    var id: String { "\(name), \(state)" }
    var formattedArea: String {
        let formatter = MeasurementFormatter()
        formatter.numberFormatter.minimumFractionDigits = 1
        return formatter.string(from: area)
    }
    var formattedPopulation: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(integerLiteral: population))!
    }
}

extension City {
    static var top20USCities: [City] = [
        City(name: "Austin", state: "Texas", population: 964177, area: Measurement(value: 828.5, unit: UnitArea.squareKilometers)),
        City(name: "Charlotte", state: "North Carolina", population: 879709, area: Measurement(value: 798.5, unit: UnitArea.squareKilometers)),
        City(name: "Chicago", state: "Illinois", population: 2696555, area: Measurement(value: 589.7, unit: UnitArea.squareKilometers)),
        City(name: "Columbus", state: "Ohio", population: 906528, area: Measurement(value: 569.8, unit: UnitArea.squareKilometers)),
        City(name: "Dallas", state: "Texas", population: 1288457, area: Measurement(value: 879.6, unit: UnitArea.squareKilometers)),
        City(name: "Denver", state: "Colorado", population: 711463, area: Measurement(value: 396.5, unit: UnitArea.squareKilometers)),
        City(name: "Fort Worth", state: "Texas", population: 935508, area: Measurement(value: 899.5, unit: UnitArea.squareKilometers)),
        City(name: "Houston", state: "Texas", population: 2288250, area: Measurement(value: 1658.6, unit: UnitArea.squareKilometers)),
        City(name: "Indianapolis", state: "Indiana", population: 882039, area: Measurement(value: 936.5, unit: UnitArea.squareKilometers)),
        City(name: "Jacksonville", state: "Florida", population: 954614, area: Measurement(value: 1935.5, unit: UnitArea.squareKilometers)),
        City(name: "Los Angeles", state: "California", population: 3849297, area: Measurement(value: 1216, unit: UnitArea.squareKilometers)),
        City(name: "New York", state: "New York", population: 8467513, area: Measurement(value: 778.3, unit: UnitArea.squareKilometers)),
        City(name: "Oklahoma City", state: "Oklahoma", population: 687725, area: Measurement(value: 1570.1, unit: UnitArea.squareKilometers)),
        City(name: "Philadelphia", state: "Pennsylvania", population: 1576251, area: Measurement(value: 348.1, unit: UnitArea.squareKilometers)),
        City(name: "Phoenix", state: "Arizona", population: 1624569, area: Measurement(value: 1341.6, unit: UnitArea.squareKilometers)),
        City(name: "San Antonio", state: "Texas", population: 1451853, area: Measurement(value: 1291.9, unit: UnitArea.squareKilometers)),
        City(name: "San Diego", state: "California", population: 1381611, area: Measurement(value: 844.1, unit: UnitArea.squareKilometers)),
        City(name: "San Francisco", state: "California", population: 815201, area: Measurement(value: 121.5, unit: UnitArea.squareKilometers)),
        City(name: "San Jose", state: "California", population: 983489, area: Measurement(value: 461.8, unit: UnitArea.squareKilometers)),
        City(name: "Seattle", state: "Washington", population: 733919, area: Measurement(value: 217, unit: UnitArea.squareKilometers))
    ]
}

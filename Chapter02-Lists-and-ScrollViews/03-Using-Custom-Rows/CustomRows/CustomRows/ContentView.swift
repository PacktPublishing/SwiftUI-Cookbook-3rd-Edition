//
//  ContentView.swift
//  CustomRows
//
//  Created by Juan Catalan on 5/4/23.
//

import SwiftUI

struct ContentView: View {
    var weatherData: [WeatherInfo]
    var body: some View {
        List {
            ForEach(weatherData) {weather in
                WeatherRow(weather: weather)
            }
        }
    }
}

#Preview {
    ContentView(weatherData: WeatherInfo.weatherData)
}

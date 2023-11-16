//
//  ContentView.swift
//  WorkingWithMarks
//
//  Created by Juan Catalan on 9/19/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    private var climateData: [CityClimate] = CityClimate.sample
    @State private var isUS = true
    @State private var isRainfallChart = true
    @State private var isToggleDisabled = false

    var body: some View {
        VStack {
            Picker("Type of chart", selection: $isRainfallChart) {
                Text("Rainfall").tag(true)
                Text("Temperatures").tag(false)
            }
            .pickerStyle(.segmented)
            .padding(.bottom)
            if isRainfallChart {
                RainfallView(isUS: isUS, climateData: climateData, isToggleDisabled: $isToggleDisabled)
            } else {
                TemperatureView(isUS: isUS, climateData: climateData, isToggleDisabled: $isToggleDisabled)
            }
            HStack {
                Text("🇪🇺")
                Toggle("", isOn: $isUS)
                    .labelsHidden()
                    .disabled(isToggleDisabled)
                Text("🇺🇸")
            }
            .font(.largeTitle)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

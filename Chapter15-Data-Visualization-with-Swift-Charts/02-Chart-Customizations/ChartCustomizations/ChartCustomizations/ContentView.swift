//
//  ContentView.swift
//  ChartCustomizations
//
//  Created by Juan Catalan on 9/6/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    private var city = CityClimate.sample[0]
    @State private var isUS = true
    private var unit: UnitLength { isUS ? .inches : .millimeters }
    var body: some View {
        VStack {
            Text("Average Rainfall (\(unit.symbol))")
                .font(.title)
            Text("for \(city.city) in \(String(format: "%d", city.year))")
            Chart {
                ForEach(city.climate, id:\.date) { monthlyData in
                    let rainfall = monthlyData.rainfall.converted(to: unit)
                    BarMark(x: .value("Month", monthlyData.date, unit: .month),
                            y: .value("Rain", rainfall.value))
                    .foregroundStyle(Gradient(colors: [.blue, .blue.opacity(0.4)]))
                    .cornerRadius(4)
                    .annotation(alignment: .center, spacing: -20) {
                        Text(String(format: isUS ? "%.1f" : "%.0f", rainfall.value))
                            .font(.caption2)
                            .foregroundStyle(.white)
                    }
                }
                let averageRainfall = city.averageRainfall.converted(to: unit)
                RuleMark(y: .value("Average", averageRainfall.value))
                    .foregroundStyle(.gray)
                    .lineStyle(.init(dash: [4]))
                    .annotation(alignment: .topLeading, spacing: 0) {
                        Text("Average = " + String(format: "%.1f", averageRainfall.value))
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .background(.white.opacity(0.2))
                    }
            }
            .aspectRatio(contentMode: .fit)
            .chartXAxis {
                AxisMarks(values: city.climate.map { $0.date } ) { _ in
                    AxisValueLabel(format: .dateTime.month(.narrow), horizontalSpacing: 11)
                    /*
                    AxisValueLabel(format: .dateTime.month(.abbreviated), orientation: .vertical,
                                   horizontalSpacing: 8, verticalSpacing: -25)
                        .foregroundStyle(.black)
                     */
                }
            }
            .chartYAxis {
                var y: Double { isUS ? 5 : 120 }
                var step: Double { isUS ? 1 : 20 }
                let format = Decimal.FormatStyle.number.precision(.fractionLength(1))
                AxisMarks(values: Array(stride(from: 0, through: y, by: step))) { _ in
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel(format: format)
                }
                AxisMarks(values: Array(stride(from: 0, through: y, by: step/5))) { value in
                    if let rainfall = value.as(Double.self), fmod(rainfall, step) != 0 {
                        AxisGridLine(
                            stroke: StrokeStyle(lineWidth: 0.5, dash: [5, 2.5], dashPhase: 0)
                        )
                    }
                }
            }
            .chartPlotStyle { content in
                content
                    .background {
                        Color.yellow.opacity(0.2)
                    }
                    .border(.brown, width: 0.5)
            }
            HStack {
                Text("🇪🇺")
                Toggle("", isOn: $isUS)
                    .labelsHidden()
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

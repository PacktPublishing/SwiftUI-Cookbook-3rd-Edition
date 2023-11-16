//
//  RangeChartView.swift
//  WorkingWithMarks
//
//  Created by Juan Catalan on 9/19/23.
//

import SwiftUI
import Charts

struct TemperatureView: View {
    var isUS: Bool
    var climateData: [CityClimate]
    @Binding var isToggleDisabled: Bool
    @State private var typeOfChart: ChartType = .bar
    @State private var cityIndex: Int = 0
    var body: some View {
        VStack {
            let temperatureUnit: UnitTemperature = isUS ? .fahrenheit : .celsius
            Text("Average Temperatures (\(temperatureUnit.symbol))")
                .font(.title)
            Chart {
                let selectedCity = climateData[cityIndex]
                ForEach(selectedCity.climate, id:\.date) { monthlyData in
                    let date = monthlyData.date
                    let xValue: PlottableValue = .value("Month", date, unit: .month)
                    let low = monthlyData.minTemperature.converted(to: temperatureUnit).value
                    let lowValue: PlottableValue = .value("Temperature", low)
                    let high = monthlyData.maxTemperature.converted(to: temperatureUnit).value
                    let highValue: PlottableValue = .value("Temperature", high)
                    let gradient = Gradient(colors: [.orange, .cyan])
                    switch typeOfChart {
                    case .bar:
                        BarMark(x: xValue, yStart: lowValue, yEnd: highValue)
                            .foregroundStyle(gradient)
                            .cornerRadius(5)
                            .annotation {
                                if date == selectedCity.highestTemperatureMonth.date {
                                    Text(String(format: "%.1f", high))
                                        .font(.caption2)
                                        .foregroundStyle(.orange)
                                }
                            }
                            .annotation(position: .bottom) {
                                if date == selectedCity.lowestTemperatureMonth.date {
                                    Text(String(format: "%.1f", low))
                                        .font(.caption2)
                                        .foregroundStyle(.cyan)
                                }
                            }
                    case .area:
                        AreaMark(x: xValue, yStart: lowValue, yEnd: highValue)
                            .interpolationMethod(.cardinal)
                            .foregroundStyle(gradient)
                    }
                }
                let averageLow = selectedCity.averageLow.converted(to: temperatureUnit).value
                let averageHigh = selectedCity.averageHigh.converted(to: temperatureUnit).value
                switch typeOfChart {
                case .bar:
                    let firstDay = DateComponents(year: selectedCity.year, month: 1, day:1)
                    let firstDate = Calendar.current.date(from: firstDay)!
                    let lastDay = DateComponents(year: selectedCity.year, month: 12, day:31)
                    let lastDate = Calendar.current.date(from: lastDay)!
                    let color = Color.black.opacity(0.5)
                    RectangleMark(xStart: .value("First month", firstDate),
                                  xEnd: .value("Last month", lastDate),
                                  yStart: .value("Average low", averageLow),
                                  yEnd: .value("Average high", averageHigh))
                        .foregroundStyle(.gray.opacity(0.1))
                        .annotation {
                            AnnotationText("Average High", color: color)
                        }
                        .annotation(position: .bottom) {
                            AnnotationText("Average Low", color: color)
                        }
                case .area:
                    RuleMark(y: .value("Average high", averageHigh))
                        .foregroundStyle(.red)
                        .lineStyle(.init(dash: [4]))
                        .annotation {
                            AnnotationText(
                                "Average High = \(String(format: "%.1f", averageHigh))",
                                color: .red
                            )
                        }
                    RuleMark(y: .value("Average low", averageLow))
                        .foregroundStyle(.blue)
                        .lineStyle(.init(dash: [4]))
                        .annotation(position: .bottom) {
                            AnnotationText(
                                "Average Low = \(String(format: "%.1f", averageLow))",
                                color: .blue
                            )
                        }
                }
            }
            .chartYScale(domain: isUS ? 25...100 : -5...45)
            Picker("City", selection: $cityIndex) {
                ForEach(0..<climateData.count, id: \.self) { index in
                    Text(climateData[index].city).tag(index)
                }
            }
            .pickerStyle(.segmented)
            HStack {
                Text("Type of chart:")
                Picker("Type of chart", selection: $typeOfChart) {
                    ForEach(ChartType.allCases, id: \.self) { chartType in
                        Text(chartType.rawValue).tag(chartType)
                    }
                }
            }
            .onAppear {
                isToggleDisabled = false
            }
        }
    }
}

extension TemperatureView {
    enum ChartType: String, CaseIterable {
        case bar
        case area
    }
    
    struct AnnotationText: View {
        var text: String
        var color: Color
        var body: some View {
            Text(text)
                .font(.caption2)
                .foregroundStyle(color)
                .padding(.horizontal, 4)
                .background(.white.opacity(0.7))
        }
        init(_ text: String, color: Color = .primary) {
            self.text = text
            self.color = color
        }
    }
}

#Preview {
    TemperatureView(isUS: true, climateData: CityClimate.sample, isToggleDisabled: .constant(true))
        .padding()
}

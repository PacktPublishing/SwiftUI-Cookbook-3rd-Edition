//
//  SimpleChartView.swift
//  WorkingWithMarks
//
//  Created by Juan Catalan on 9/19/23.
//

import SwiftUI
import Charts

struct RainfallView: View {
    var isUS: Bool
    var climateData: [CityClimate]
    @Binding var isToggleDisabled: Bool
    @State private var typeOfChart: ChartType = .bar

    var body: some View {
        VStack {
            let rainfallUnit: UnitLength = isUS ? .inches : .millimeters
            Text("Average Rainfall (\(rainfallUnit.symbol))")
                .font(.title)
            Chart(climateData, id:\.city) { cityClimate in
                let city = cityClimate.city
                ForEach(cityClimate.climate, id:\.date) { monthlyData in
                    let xValue: PlottableValue = .value("Month", monthlyData.date, unit: .month)
                    let rainfall = monthlyData.rainfall.converted(to: rainfallUnit).value
                    let yValue: PlottableValue = .value("Rain", rainfall)
                    switch typeOfChart {
                    case .bar:
                        BarMark(x: xValue, y: yValue)
                            .foregroundStyle(by: .value("City", city))
                            .position(by: .value("City", city))
                            .annotation {
                                if monthlyData.date == cityClimate.highestRainfallMonth.date {
                                    let format = isUS ? "%.1f" : "%.0f"
                                    Text(String(format: format, rainfall))
                                        .font(.caption2)
                                        .padding(4)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(.black, lineWidth: 1)
                                        }
                                }
                            }
                    case .line:
                        LineMark(x: xValue, y: yValue)
                            .foregroundStyle(by: .value("City", city))
                    case .points:
                        PointMark(x: xValue, y: yValue)
                            .foregroundStyle(by: .value("City", city))
                            .symbol(by: .value("City", city))
                        LineMark(x: xValue, y: yValue)
                            .foregroundStyle(by: .value("City", city))
                            .interpolationMethod(.catmullRom)
                            .lineStyle(StrokeStyle(dash: [2]))
                    case .area:
                        AreaMark(x: xValue, y: yValue)
                            .foregroundStyle(by: .value("City", city))
                            .annotation(position: .trailing) {
                                Text(city)
                                    .font(.caption)
                                    .background(Color.white.opacity(0.5))
                            }
                    case .areaNormalized:
                        AreaMark(x: xValue, y: yValue, stacking: .normalized)
                            .foregroundStyle(by: .value("City", city))
                            .annotation(position: .overlay) {
                                Text(city)
                                    .font(.caption)
                            }
//                    @unknown default:
//                        BarMark(x: xValue, y: .value("Rain", 0))
                    }
                }
            }
            HStack {
                Text("Type of chart:")
                Picker("Type of chart", selection: $typeOfChart) {
                    ForEach(ChartType.allCases, id: \.self) { chartType in
                        Text(chartType.rawValue).tag(chartType)
                    }
                }
                .onChange(of: typeOfChart) { _, newValue in
                    isToggleDisabled = newValue == .areaNormalized
                }
            }
        }
    }
}

extension RainfallView {
    enum ChartType: String, CaseIterable {
        case bar
        case line
        case points
        case area
        case areaNormalized = "area normalized"
    }
}

#Preview {
    RainfallView(isUS: true, climateData: CityClimate.sample, isToggleDisabled: .constant(true))
        .padding()
}

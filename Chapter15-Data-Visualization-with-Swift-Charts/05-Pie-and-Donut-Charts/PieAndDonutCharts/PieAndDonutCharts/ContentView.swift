//
//  ContentView.swift
//  PieAndDonutCharts
//
//  Created by Juan Catalan on 9/28/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    private var data: TotalSales = .texas
    @State private var isDonutChart = false
    var body: some View {
        VStack {
            Picker("Type of Chart", selection: $isDonutChart) {
                Text("Pie Chart").tag(false)
                Text("Donut Chart").tag(true)
            }
            .pickerStyle(.segmented)
            .padding(.bottom)
            Text("Sales by City")
                .font(.title)
            Chart(data.total, id:\.city) { citySales in
                SectorMark(angle: .value("Sales", citySales.sales),
                           innerRadius: isDonutChart ? .ratio(0.45) : 0,
                           angularInset: 1)
                .foregroundStyle(by: .value("City", citySales.city))
                .annotation(position: .overlay) {
                    VStack {
                        if isDonutChart {
                            Text(citySales.city.rawValue)
                        }
                        Text(
                            citySales.sales,
                            format: Decimal.FormatStyle.Currency(code: "USD").scale(1e-6)
                        ) + Text("M")
                    }
                    .font(.caption2)
                    .foregroundStyle(.black)
                    .padding(4)
                    .background(.white.opacity(0.7))
                    .cornerRadius(4)
                }
            }
            .aspectRatio(contentMode: .fit)
            .chartForegroundStyleScale(
                [
                    City.houston: .red,
                    .dallas: .yellow,
                    .sanAntonio: .brown,
                    .austin: .cyan
                ]
            )
            .chartLegend(isDonutChart ? .hidden : .visible)
        }
        .padding()
    }
}

extension City: Plottable {}

#Preview {
    ContentView()
}

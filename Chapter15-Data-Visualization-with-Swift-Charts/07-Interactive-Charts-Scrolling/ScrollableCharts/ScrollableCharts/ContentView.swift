//
//  ContentView.swift
//  ScrollableCharts
//
//  Created by Juan Catalan on 10/31/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    private let stock: Stock = .AAPL
    @State private var range: DateRange = .oneYear
    @State private var start: Date = Stock.AAPL.endDate
    var body: some View {
        VStack(alignment: .leading) {
            TickerView(stock: stock)
            Picker("Date range", selection: $range) {
                ForEach(DateRange.allCases, id: \.self) { range in
                    Text(range.rawValue).tag(range)
                }
            }
            .pickerStyle(.segmented)
            Chart {
                ForEach(stock.prices, id: \.date) { price in
                    LineMark(
                        x: .value("Date", price.date),
                        y: .value("Price", price.close)
                    )
                    AreaMark(
                        x: .value("Date", price.date),
                        y: .value("Price", price.close)
                    )
                    .foregroundStyle(.blue.opacity(0.4))
                }
            }
            .chartXVisibleDomain(length: range.timeInterval)
            .chartScrollableAxes(.horizontal)
            .chartScrollPosition(x: $start)
            .chartXAxis {
                AxisMarks(values: .automatic(desiredCount: 5)) {
                    if range.isMonthly {
                        AxisValueLabel(format: .dateTime.month(.abbreviated))
                    }
                    AxisValueLabel(format: .dateTime.year(), verticalSpacing: 16)
                    AxisTick()
                    AxisGridLine()
                }
            }
            .chartYScale(
                domain: stock.yDomain(from: start, for: range)
            )
            .chartYAxis {
                AxisMarks { value in
                    AxisGridLine()
                    let y = value.as(Double.self)!
                    AxisValueLabel(String(format: "%5.1f", y))
                }
            }
            .onChange(of: range, initial: true) {
                start = range.startDate(from: stock.endDate)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

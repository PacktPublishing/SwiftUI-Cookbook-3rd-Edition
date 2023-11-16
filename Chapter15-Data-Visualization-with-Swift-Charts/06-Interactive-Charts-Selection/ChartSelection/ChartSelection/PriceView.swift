//
//  PriceView.swift
//  ChartSelection
//
//  Created by Juan Catalan on 9/30/23.
//

import SwiftUI
import Charts

struct PriceView: View {
    var stock: Stock
    @Binding var selectedIndex: Int?
    var body: some View {
        Chart {
            ForEach(stock.prices.indices, id: \.self) { index in
                let isSelected = selectedIndex != nil && index == selectedIndex!
                let price = stock.prices[index]
                let color: Color = price.closedHigher ? .green : .red
                BarMark(x: .value("Index", index),
                        yStart: .value("Price", price.low),
                        yEnd: .value("Price", price.high),
                        width: 1)
                .foregroundStyle(isSelected ? .yellow : color)
                BarMark(x: .value("Index", index),
                        yStart: .value("Price", price.open),
                        yEnd: .value("Price", price.close),
                        width: 8)
                .foregroundStyle(isSelected ? .yellow : color)
            }
            if let index = selectedIndex {
                let price = stock.prices[index]
                RuleMark(x: .value("Selected", index))
                    .foregroundStyle(.gray.opacity(0.3))
                    .offset(yStart: 0)
                    .zIndex(-1)
                    .annotation(
                        position: .top,
                        overflowResolution: .init(x: .fit(to: .chart), y: .disabled)
                    ) {
                        PriceDetailView(ticker: stock.ticker, price: price)
                    }
            }
        }
        .chartXScale(domain: stock.xDomain)
        .chartYScale(domain: stock.yDomain)
        .chartXAxis {
            let minX = stock.xDomain[0]
            let maxX = stock.xDomain[1]
            let values = Array(stride(from: minX, through: maxX, by: 1))
            AxisMarks(values: values) { value in
                AxisGridLine()
                let index = value.as(Int.self)!
                let day = stock.prices[index].date.formatted(.dateTime.day())
                AxisValueLabel(day, horizontalSpacing: 0)
                if index == 0 {
                    let monthYear = stock.prices[index].date.formatted(.dateTime.month().year())
                    AxisValueLabel(monthYear, horizontalSpacing: 0, verticalSpacing: 20)
                }
            }
        }
        .chartYAxis {
            let minY = stock.yDomain[0].rounded(.up)
            let maxY = stock.yDomain[1].rounded(.down)
            let values = Array(stride(from: minY, through: maxY, by: 1))
            AxisMarks(values: values) { value in
                let price = value.as(Int.self)!
                if price % 5 != 0 {
                    AxisGridLine(stroke: .init(lineWidth: 0.25, dash: [3, 2]))
                } else {
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel()
                }
            }
        }
        .chartXSelection(value: $selectedIndex)
    }
}

#Preview {
    PriceView(stock: .AAPL,selectedIndex: .constant(6))
        .frame(height:500)
        .padding()
}

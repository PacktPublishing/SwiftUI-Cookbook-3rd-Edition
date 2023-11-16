//
//  VolumeView.swift
//  ChartSelection
//
//  Created by Juan Catalan on 9/30/23.
//

import SwiftUI
import Charts

struct VolumeView: View {
    var stock: Stock
    @Binding var selectedIndex: Int?
    var body: some View {
        Chart {
            ForEach(stock.prices.indices, id: \.self) { index in
                let isSelected = selectedIndex != nil && index == selectedIndex!
                let price = stock.prices[index]
                let color: Color = price.closedHigherThanPrevious ? .green : .red
                BarMark(x: .value("Index", index),
                        y: .value("Volume", price.volume),
                        width: 14)
                .foregroundStyle(isSelected ? .yellow : color)
            }
            if let index = selectedIndex {
                let price = stock.prices[index]
                RuleMark(
                    x: .value("Selected", index)
                )
                .foregroundStyle(.gray.opacity(0.3))
                .offset(yStart: 25)
                .zIndex(-1)
                .annotation(position: .top, overflowResolution: .init(x: .fit(to: .chart), y: .disabled)) {
                    VolumeDetailView(price: price)
                }
            }
            
        }
        .frame(height: 100)
        .chartXScale(domain: stock.xDomain)
        .chartXAxis(.hidden)
        .chartYAxis {
            let format: Decimal.FormatStyle =
                .number.scale(1e-6).precision(.fractionLength(0))
            AxisMarks { value in
                AxisGridLine()
                AxisValueLabel(format: format, horizontalSpacing: 8)
            }
        }
        .chartXSelection(value: $selectedIndex)
    }
}

#Preview {
    VolumeView(stock: .AAPL, selectedIndex: .constant(8))
        .padding()
}

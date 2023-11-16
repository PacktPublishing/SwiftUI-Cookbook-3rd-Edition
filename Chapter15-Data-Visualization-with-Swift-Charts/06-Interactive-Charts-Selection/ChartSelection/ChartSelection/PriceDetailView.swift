//
//  StockInfoView.swift
//  ChartSelection
//
//  Created by Juan Catalan on 9/30/23.
//

import SwiftUI

struct PriceDetailView: View {
    var ticker: String
    var price: StockPrice
    private let priceFormat: FloatingPointFormatStyle<Double> = .number.precision(.fractionLength(2...2))
    
    var body: some View {
        VStack {
            Text("\(ticker) - \(price.date, format: .dateTime.month(.abbreviated).day())")
                .font(.callout)
            Group {
                Text("O: \(price.open, format: priceFormat) - C: \(Text(price.close, format: priceFormat).foregroundStyle(price.closedHigher ? .green : .red))")
                Text("H: \(price.high, format: priceFormat) - L: \(price.low, format: priceFormat)")
            }
            .font(.caption2)
            .monospaced()
        }
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(.gray.opacity(0.2))
        }
    }
}

#Preview {
    VStack {
        PriceDetailView(ticker: Stock.AAPL.ticker, price: Stock.AAPL.prices[0])
        PriceDetailView(ticker: Stock.AAPL.ticker, price: Stock.AAPL.prices[5])
    }
}

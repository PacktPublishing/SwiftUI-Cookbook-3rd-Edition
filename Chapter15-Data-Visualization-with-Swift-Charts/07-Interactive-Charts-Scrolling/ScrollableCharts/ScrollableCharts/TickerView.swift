//
//  TickerView.swift
//  ScrollableCharts
//
//  Created by Juan Catalan on 9/30/23.
//

import SwiftUI

struct TickerView: View {
    var stock: Stock
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .lastTextBaseline) {
                Text(stock.ticker)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(stock.company)
                    .font(.caption)
            }
            Text("\(stock.exchange) - \(stock.currency)")
                .font(.footnote)
        }
    }
}

#Preview {
    TickerView(stock: .AAPL)
}

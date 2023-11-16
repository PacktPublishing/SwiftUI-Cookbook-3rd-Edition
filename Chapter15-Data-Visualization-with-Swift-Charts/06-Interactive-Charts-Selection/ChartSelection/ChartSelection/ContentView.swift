//
//  ContentView.swift
//  InteractiveCharts
//
//  Created by Juan Catalan on 9/30/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    private let stock: Stock = .AAPL
    @State private var selectedIndex: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            TickerView(stock: stock)
                .opacity(selectedIndex == nil ? 1: 0)
            PriceView(stock: stock, selectedIndex: $selectedIndex)
            VolumeView(stock: stock, selectedIndex: $selectedIndex)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

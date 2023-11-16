//
//  VolumeDetailView.swift
//  ChartSelection
//
//  Created by Juan Catalan on 9/30/23.
//

import SwiftUI

struct VolumeDetailView: View {
    var price: StockPrice
    private let volumeFormat: FloatingPointFormatStyle<Double> = 
        .number.scale(1e-6).precision(.fractionLength(1...1))

    var body: some View {
        HStack(spacing: 0) {
            Text("VOL: ")
            Text("\(price.volume, format: volumeFormat)M").foregroundStyle(price.closedHigherThanPrevious ? .green : .red)
                .bold()
        }
        .font(.caption2)
        .monospaced()
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(.gray.opacity(0.2))
        }
    }
}

#Preview {
    VStack {
        VolumeDetailView(price: Stock.AAPL.prices[5])
        VolumeDetailView(price: Stock.AAPL.prices[8])
    }
}

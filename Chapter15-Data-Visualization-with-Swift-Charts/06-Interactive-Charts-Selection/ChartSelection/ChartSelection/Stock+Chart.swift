//
//  Stock+Chart.swift
//  ChartSelection
//
//  Created by Juan Catalan on 9/18/23.
//

import Foundation

extension StockPrice {
    var closedHigher: Bool { close > open }
    var closedHigherThanPrevious: Bool { close > prevClose }
}

extension Stock {
    var highestPrice: StockPrice {
        prices.max { $0.high < $1.high }!
    }
    var lowestPrice: StockPrice {
        prices.min { $0.low < $1.low }!
    }
}

extension Stock {
    var xDomain: [Int]  { [0, prices.count - 1] }
    var yMax: Double { highestPrice.high }
    var yMin: Double { lowestPrice.low }
    var yDomain: [Double] { [yMin, yMax] }
}

//
//  StockPrice.swift
//  ChartCustomizations
//
//  Created by Juan Catalan on 9/18/23.
//

import Foundation

struct StockPrice: Decodable {
    let date: Date
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    let prevClose: Double
    let volume: Double
}

struct Stock {
    let ticker: String
    let company: String
    let exchange: String
    let currency: String
    let prices: [StockPrice]
    
    init(ticker: String, company: String, exchange: String, currency: String, prices: [StockPrice]) {
        self.ticker = ticker
        self.company = company
        self.exchange = exchange
        self.currency = currency
        self.prices = prices.sorted { $0.date < $1.date }
    }
}

extension Stock {
    static var  AAPL: Stock = {
        let url = Bundle.main.url(
            forResource: "AAPL_Aug_2023",
            withExtension: "json"
        )
        assert(url != nil)
        let data = try? Data(contentsOf: url!)
        assert(data != nil)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let decoder  = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        let array = try? decoder.decode([StockPrice].self, from: data!)
        assert(array != nil)
        return Stock(
            ticker: "AAPL",
            company: "Apple Inc.",
            exchange: "NASDAQ",
            currency: "USD",
            prices:array!
        )
    }()
}

//
//  Stock+Chart.swift
//  ScrollableCharts
//
//  Created by Juan Catalan on 10/29/23.
//

import Foundation

enum DateRange: String, CaseIterable {
    case oneYear = "1Y"
    case twoYears = "2Y"
    case fiveYears = "5Y"
    case tenYears = "10Y"
    
    var isMonthly: Bool {
        self == .oneYear || self == .twoYears
    }
    var timeInterval: TimeInterval {
        return switch self {
        case .oneYear: 31536000
        case .twoYears: 63072000
        case .fiveYears: 157766400
        case .tenYears: 315532800
        }
    }
    func startDate(from endDate: Date) -> Date {
        endDate - timeInterval
    }
}

extension Stock {
    var endDate: Date { prices.last!.date }
    func yDomain(from date1: Date, for range: DateRange) -> ClosedRange<Double> {
        let date2 = date1 + range.timeInterval
        let subset = prices.filter { (date1 <= $0.date) && ( $0.date <= date2) }
        let high = subset.max { $0.close < $1.close }!
        let low = subset.min { $0.close < $1.close }!
        return low.low...high.high
    }
}

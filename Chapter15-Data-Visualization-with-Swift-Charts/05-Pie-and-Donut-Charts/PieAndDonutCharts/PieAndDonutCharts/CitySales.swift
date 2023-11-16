//
//  Sales.swift
//  PieAndDonutCharts
//
//  Created by Juan Catalan on 9/28/23.
//

import Foundation

enum City: String {
    case austin = "Austin"
    case dallas = "Dallas"
    case houston = "Houston"
    case sanAntonio = "San Antonio"
}

struct CitySales {
    let city: City
    let sales: Decimal
}

struct TotalSales {
    let total: [CitySales]
    
    init(total: [CitySales]) {
        self.total = total.sorted { $0.sales > $1.sales }
    }
}

extension TotalSales {
    static var texas: TotalSales = .init(total: [
        .init(city: .austin, sales: .init(integerLiteral: 5321878)),
        .init(city: .dallas, sales: .init(integerLiteral: 18399650)),
        .init(city: .houston, sales: .init(integerLiteral: 35562804)),
        .init(city: .sanAntonio, sales: .init(integerLiteral: 10391429))
    ])
}

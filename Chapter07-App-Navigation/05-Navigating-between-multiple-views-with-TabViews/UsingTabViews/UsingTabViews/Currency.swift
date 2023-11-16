//
//  Currency.swift
//  UsingTabViews
//
//  Created by Juan Catalan on 7/20/23.
//

import Foundation

struct Currency: Identifiable {
    let id = UUID()
    var name:String
    var image:String
}

extension Currency {
    static var currencies = [
        Currency(name: "Dollar", image: "dollarsign.circle.fill"),
        Currency(name: "Sterling", image: "sterlingsign.circle.fill"),
        Currency(name: "Euro", image: "eurosign.circle.fill"),
        Currency(name: "Yen", image: "yensign.circle.fill"),
        Currency(name: "Naira", image: "nairasign.circle.fill")]
}

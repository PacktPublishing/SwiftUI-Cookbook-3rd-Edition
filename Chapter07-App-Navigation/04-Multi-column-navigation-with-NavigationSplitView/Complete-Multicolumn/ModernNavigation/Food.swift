//
//  Food.swift
//  ModernNavigation
//
//  Created by Juan Catalan on 7/11/23.
//

import Foundation

struct Food: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var category: Category
}

extension Food {
    static let samples: [Food] = [
        Food(name: "Apple", category: .fruit),
        Food(name: "Pear", category: .fruit),
        Food(name: "Orange", category: .fruit),
        Food(name: "Lemon", category: .fruit),
        Food(name: "Strawberry", category: .fruit),
        Food(name: "Plum", category: .fruit),
        Food(name: "Banana", category: .fruit),
        Food(name: "Melon", category: .fruit),
        Food(name: "Watermelon", category: .fruit),
        Food(name: "Peach", category: .fruit),
        Food(name: "Pork", category: .meat),
        Food(name: "Beef", category: .meat),
        Food(name: "Lamb", category: .meat),
        Food(name: "Goat", category: .meat),
        Food(name: "Chicken", category: .meat),
        Food(name: "Turkey", category: .meat),
        Food(name: "Fish", category: .meat),
        Food(name: "Crab", category: .meat),
        Food(name: "Lobster", category: .meat),
        Food(name: "Shrimp", category: .meat),
        Food(name: "Carrot", category: .vegetable),
        Food(name: "Lettuce", category: .vegetable),
        Food(name: "Tomato", category: .vegetable),
        Food(name: "Onion", category: .vegetable),
        Food(name: "Broccoli", category: .vegetable),
        Food(name: "Cauliflower", category: .vegetable),
        Food(name: "Eggplant", category: .vegetable),
        Food(name: "Swiss Chard", category: .vegetable),
        Food(name: "Spinach", category: .vegetable),
        Food(name: "Zucchini", category: .vegetable)
    ]
}


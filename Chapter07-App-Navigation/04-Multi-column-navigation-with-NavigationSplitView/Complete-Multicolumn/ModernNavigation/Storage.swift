//
//  Storage.swift
//  ModernNavigation
//
//  Created by Juan Catalan on 7/11/23.
//

import Foundation

final class Storage: ObservableObject {
    @Published var food: [Food]
    @Published var recents: [Food]

    init(food: [Food], recents: [Food] = []) {
        self.food = food
        self.recents = recents
    }

    func food(in category: Category) -> [Food] {
        food
            .filter { $0.category == category }
            .sorted { $0.name < $1.name }
    }
    
    func addRecent(_ food: Food) {
        if !recents.contains(food) {
            recents = [food] + Array(recents.prefix(2))
        }
    }
}

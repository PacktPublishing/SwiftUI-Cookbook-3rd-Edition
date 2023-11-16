//
//  ContentView.swift
//  SearchableLists
//
//  Created by Juan Catalan on 5/5/23.
//

import SwiftUI

struct ContentView: View {
    enum FruitSearchScope: Hashable {
        case all
        case food(Food.Category)
    }
    @State private var scope: FruitSearchScope = .all
    @State private var searchText = ""
    let food: [Food] = Food.sampleFood
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { food in
                    LabeledContent(food.name) { Text(food.category.rawValue) }
                }
            }
            .searchable(text: $searchText, prompt: "Search for a food")
            .searchScopes($scope, activation: .onSearchPresentation) {
                Text("All").tag(FruitSearchScope.all)
                Text("Fruit").tag(FruitSearchScope.food(.fruit))
                Text("Meat").tag(FruitSearchScope.food(.meat))
                Text("Vegetable").tag(FruitSearchScope.food(.vegetable))
            }
            .navigationBarTitle("Foods")
        }
    }
    var searchResults: [Food] {
        var food: [Food] = self.food
        if case let .food(category) = scope {
            food = food.filter { $0.category == category }
        }
        if !searchText.isEmpty {
            food = food.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        return food
    }
}

#Preview {
    ContentView()
}

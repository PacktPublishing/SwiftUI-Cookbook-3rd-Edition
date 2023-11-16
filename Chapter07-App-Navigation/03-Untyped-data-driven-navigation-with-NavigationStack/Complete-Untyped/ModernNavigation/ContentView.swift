//
//  ContentView.swift
//  ModernNavigation
//
//  Created by Juan Catalan on 7/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigation = Navigation()
    @StateObject private var storage = Storage(food: Food.samples)
    var body: some View {
        NavigationStack(path: $navigation.path) {
            List {
                Section("Contents") {
                    ForEach(Category.allCases) { category in
                        NavigationLink(category.name, value: category)
                    }
                }
                Section("Favorites") {
                    if storage.favorites.isEmpty {
                        Text("No favorites added")
                    } else {
                        ForEach(storage.favorites) { food in
                            NavigationLink(value: food) {
                                FoodRowView(food: food)
                            }
                        }
                    }
                }
            }
            .navigationTitle("My Food")
            .navigationDestination(for: Category.self) { category in
                FoodCategoryView(category: category)
                    .environmentObject(storage)
            }
            .navigationDestination(for: Food.self) { food in
                FoodView(food: food)
                    .environmentObject(navigation)
                    .environmentObject(storage)
            }
        }
    }
}

#Preview {
    ContentView()
}

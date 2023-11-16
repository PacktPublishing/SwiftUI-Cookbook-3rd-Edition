//
//  FoodCategoryView.swift
//  ModernNavigation
//
//  Created by Juan Catalan on 7/18/23.
//

import SwiftUI

struct FoodCategoryView: View {
    @EnvironmentObject private var storage: Storage
    @Binding var selectedCategory: Category?
    @Binding var selectedFood: Food?
    var body: some View {
        if let selectedCategory {
            List(storage.food(in: selectedCategory), selection: $selectedFood) { food in
                NavigationLink(value: food) {
                    FoodRowView(food: food)
                }
            }
            .navigationTitle(selectedCategory.name)
        } else {
            Text("Choose a category")
        }
    }
}

#Preview {
    NavigationStack {
        FoodCategoryView(selectedCategory: .constant(.fruit), selectedFood: .constant(nil))
            .environmentObject(Storage(food: Food.samples))
    }
}

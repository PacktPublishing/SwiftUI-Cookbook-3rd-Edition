//
//  FoodRowView.swift
//  ModernNavigation
//
//  Created by Juan Catalan on 7/11/23.
//

import SwiftUI

struct FoodRowView: View {
    var food: Food
    var body: some View {
        LabeledContent {
            Image(food.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
        } label: {
            Text(food.name)
        }
    }
}

#Preview {
    let fruits = Array(Food.samples.prefix(4))
    return NavigationStack {
        List(fruits) { fruit in
            NavigationLink(value: fruit) {
                FoodRowView(food: fruit)
            }
        }
        .navigationTitle(fruits.first!.category.name)
    }
}

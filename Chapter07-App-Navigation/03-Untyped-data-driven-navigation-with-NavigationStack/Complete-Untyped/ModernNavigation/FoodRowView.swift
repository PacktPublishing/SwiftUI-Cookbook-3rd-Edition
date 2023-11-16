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
            Image(food.name, bundle: .main)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
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

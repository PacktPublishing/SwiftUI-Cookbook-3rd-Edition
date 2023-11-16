//
//  FoodView.swift
//  ModernNavigation
//
//  Created by Juan Catalan on 7/18/23.
//

import SwiftUI

struct FoodView: View {
    @EnvironmentObject private var storage: Storage
    @Binding var selectedCategory: Category?
    @Binding var selectedFood: Food?
    var body: some View {
        if let food  = selectedFood {
            VStack(alignment: .leading) {
                CategoryView(category: food.category)
                    .padding(.leading)
                Image(food.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                if storage.recents.isEmpty {
                    Spacer()
                } else {
                    List {
                        Section("Recents") {
                            ForEach(storage.recents) { recent in
                                FoodRowView(food: recent)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        if recent != food {
                                            selectedFood = recent
                                            selectedCategory = recent.category
                                        }
                                    }
                            }
                        }
                    }
                    .listStyle(.grouped)
                }
            }
            .navigationTitle(food.name)
            .onChange(of: food) { oldValue, newValue in
                storage.addRecent(oldValue)
            }
            .onDisappear() { [selectedFood] in
                storage.addRecent(selectedFood!)
            }
        } else {
            Text("Choose a type of food")
        }
    }
}

#Preview {
    let fruits = Array(Food.samples.prefix(3))
    return NavigationStack {
        FoodView(selectedCategory: .constant(.fruit), selectedFood: .constant(fruits.first!))
            .environmentObject(Storage(food: Food.samples, recents: fruits))
    }
}

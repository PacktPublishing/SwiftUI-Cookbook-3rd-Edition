//
//  FoodView.swift
//  ModernNavigation
//
//  Created by Juan Catalan on 7/11/23.
//

import SwiftUI

struct FoodView: View {
    @EnvironmentObject private var navigation: Navigation
    @EnvironmentObject private var storage: Storage
    var food: Food
    var body: some View {
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
                            NavigationLink(value: recent) {
                                FoodRowView(food: recent)
                            }
                            .disabled(recent == food)
                        }
                    }
                }
                .listStyle(.grouped)
            }
        }
        .navigationTitle(food.name)
        .toolbar {
            Button {
                storage.toggleFavorite(food)
            } label: {
                if storage.isFavorite(food) {
                    Image(systemName: "minus.square")
                } else {
                    Image(systemName: "plus.square")
                }
            }
            Button {
                navigation.popToRoot()
            } label: {
                Image(systemName: "list.bullet")
            }
        }
        .onDisappear {
            storage.addRecent(food)
        }
    }
}

#Preview {
    let fruits = Array(Food.samples.prefix(3))
    return NavigationStack {
        FoodView(food: fruits.first!)
            .environmentObject(Navigation())
            .environmentObject(Storage(food: Food.samples, recents: fruits))
    }
}

//
//  ContentView.swift
//  ListRowEdit
//
//  Created by Edgar Nzokwe on 7/29/21.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["USA", "Canada", "Mexico", "England", "Spain", "Cameroon", "South Africa", "Japan", "South Korea"]
    var body: some View {
        NavigationStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Text(country)
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("Countries")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func deleteItem(at indexSet: IndexSet) {
        countries.remove(atOffsets: indexSet)
    }
}

#Preview {
    ContentView()
}

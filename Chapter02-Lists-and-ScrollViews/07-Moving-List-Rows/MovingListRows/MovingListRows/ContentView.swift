//
//  ContentView.swift
//  MovingListRows
//
//  Created by Edgar Nzokwe on 8/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["USA", "Canada", "England", "Spain", "Cameroon", "South Africa", "Mexico", "Japan", "South Korea"]
    var body: some View {
        NavigationStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Text(country)
                }
                .onMove(perform: moveRow)
            }
            .navigationTitle("Countries")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func moveRow(source: IndexSet, destination: Int) {
        countries.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ContentView()
}

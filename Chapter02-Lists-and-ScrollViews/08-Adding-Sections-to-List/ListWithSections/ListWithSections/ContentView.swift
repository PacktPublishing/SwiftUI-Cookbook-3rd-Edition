//
//  ContentView.swift
//  ListWithSections
//
//  Created by Edgar Nzokwe on 8/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("North America")) {
                    Text("USA")
                    Text("Canada")
                    Text("Mexico")
                    Text("Panama")
                    Text("Anguila")
                }
                Section(header: Text("Africa")) {
                    Text("Nigeria")
                    Text("Ghana")
                    Text("Kenya")
                    Text("Senegal")
                }
                Section(header: Text("Europe")) {
                    Text("Spain")
                    Text("France")
                    Text("Sweden")
                    Text("Finland")
                    Text("UK")
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Continents and Countries")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}

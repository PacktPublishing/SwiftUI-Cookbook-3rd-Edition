//
//  ContentView.swift
//  SimpleNavigation
//
//  Created by Juan Catalan on 7/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Show First View") {
                    FirstView()
                }
                NavigationLink("Show Second View") {
                    SecondView()
                }
                NavigationLink("Show Thrid View") {
                    ThirdView()
                }
                NavigationLink("Show Fourth View") {
                    FourthView()
                }
            }
            .navigationTitle("Top Level")
        }
        .tint(.teal)
    }
}

#Preview {
    ContentView()
}

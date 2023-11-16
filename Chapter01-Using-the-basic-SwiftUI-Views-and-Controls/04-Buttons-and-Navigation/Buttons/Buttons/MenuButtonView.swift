//
//  MenuButtonView.swift
//  ButtonsApp
//
//  Created by Juan Catalan on 4/30/23.
//

import SwiftUI

struct MenuButtonView: View {
    var body: some View {
        Menu("Choose a country") {
            Button("Canada") { print("Selected Canada") }
            Button("Mexico") { print("Selected Mexico") }
            Button("USA") { print("Selected USA") }
        }
        .navigationTitle("MenuButtons")
    }
}

#Preview {
    NavigationStack {
        MenuButtonView()
    }
}

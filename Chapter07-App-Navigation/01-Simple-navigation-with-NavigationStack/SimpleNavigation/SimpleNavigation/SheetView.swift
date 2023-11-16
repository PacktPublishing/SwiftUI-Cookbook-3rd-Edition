//
//  SheetView.swift
//  SimpleNavigation
//
//  Created by Juan Catalan on 7/7/23.
//

import SwiftUI

struct SheetView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: UIColor(red: 0, green: 0.9, blue: 1, alpha: 1))
                    .ignoresSafeArea()
                Text("Sheet with navigation bar")
            }
            .navigationTitle("Sheet title")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.teal, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    SheetView()
}

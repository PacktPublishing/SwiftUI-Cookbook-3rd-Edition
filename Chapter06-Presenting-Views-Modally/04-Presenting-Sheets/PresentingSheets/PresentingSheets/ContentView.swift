//
//  ContentView.swift
//  PresentingSheets
//
//  Created by Juan Catalan on 6/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isSheetPresented = false
    @State private var isSheetWithNavPresented = false
    @State private var isFullScreenCoverPresented = false
    var body: some View {
        VStack(spacing: 20) {
            Button("Try me!") {
                print("Try me!")
            }.padding(.bottom, 200)

            Button("Show sheet with drag") {
                isSheetPresented = true
            }.sheet(isPresented: $isSheetPresented) {
                SheetView()
                    .presentationDragIndicator(.visible)
            }

            Button("Show sheet with navigation bar") {
                isSheetWithNavPresented = true
            }.sheet(isPresented: $isSheetWithNavPresented) {
                print("Sheet dismissed")
            } content: {
                SheetWithNavBar(text: "Sheet with navigation bar and presentation detents")
                    .presentationDetents([.medium, .large])
                    .presentationBackgroundInteraction(.enabled)
            }

            Button("Show full screen cover") {
                isFullScreenCoverPresented = true
            }.fullScreenCover(isPresented: $isFullScreenCoverPresented) {
                SheetWithNavBar(text: "Full screen cover with navigation bar")
            }
        }
    }
}

#Preview {
    ContentView()
}

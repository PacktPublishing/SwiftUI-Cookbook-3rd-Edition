//
//  ContentView.swift
//  AlertsWithActions
//
//  Created by Juan Catalan on 6/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var changeText = false
    @State private var displayedText = "Tap to Change Text"
    var body: some View {
        Button(displayedText) {
            changeText = true
        }.alert("Changing Text", isPresented: $changeText) {
            Button("Yes", role: .destructive) {
                displayedText = if (displayedText == "Stay Foolish") { 
                    "Stay Hungry" } else {
                        "Stay Foolish"
                    }
            }
            Button("Do Nothing", role: .cancel) {}
        } message: {
            Text("Do you want to change the text?")
        }
    }
}

#Preview {
    ContentView()
}

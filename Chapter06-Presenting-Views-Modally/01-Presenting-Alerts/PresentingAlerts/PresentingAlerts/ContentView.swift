//
//  ContentView.swift
//  PresentingAlerts
//
//  Created by Juan Catalan on 6/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showSubmitAlert = false
    var body: some View {
        Button("Show alert") {
            showSubmitAlert = true
        }
        .alert("Confirm Actions", isPresented: $showSubmitAlert ) {
            Button("OK") {}
        } message: {
            Text("Are you sure you want to proceed?")
        }
    }
}

#Preview {
    ContentView()
}

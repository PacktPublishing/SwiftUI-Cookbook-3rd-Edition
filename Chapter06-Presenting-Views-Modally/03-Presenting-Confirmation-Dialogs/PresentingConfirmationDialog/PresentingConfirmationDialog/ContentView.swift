//
//  ContentView.swift
//  PresentingConfirmationDialog
//
//  Created by Juan Catalan on 6/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showDialog = false
    private var title  = "Confirmation Dialog"
    var body: some View {
        Button("Present Confirmation Dialog") {
            showDialog = true
        }
        .confirmationDialog(title, isPresented: $showDialog) {
            Button("Save") {
                print("Save action")
            }
            Button("Print") {
                print("Print action")
            }
            Button("Update", role: .destructive) {
                print("Update action")
            }
        } message:  {
            Text("Use Confirmation Dialogs to present several actions")
        }
    }
}

#Preview {
    ContentView()
}

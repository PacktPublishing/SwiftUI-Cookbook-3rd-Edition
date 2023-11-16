//
//  FourthView.swift
//  SimpleNavigation
//
//  Created by Juan Catalan on 7/7/23.
//

import SwiftUI

struct FourthView: View {
    @State private var isSheetPresented = false
    var body: some View {
        ScrollView {
            Image(systemName: "capsule")
                .font(.system(size: 80))
                .foregroundStyle(.red)
                .padding(.vertical, 50)
            Text("This is the Fourth View")
                .foregroundStyle(.primary)
                .padding()
            Button("Show sheet") {
                isSheetPresented = true
            }.sheet(isPresented: $isSheetPresented) {
                SheetView()
                    .presentationDetents([.fraction(0.75)])
                    .presentationDragIndicator(.visible)
            }
        }
        .navigationTitle("Fourth")
        .toolbarBackground(.quaternary, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        FourthView()
    }
}

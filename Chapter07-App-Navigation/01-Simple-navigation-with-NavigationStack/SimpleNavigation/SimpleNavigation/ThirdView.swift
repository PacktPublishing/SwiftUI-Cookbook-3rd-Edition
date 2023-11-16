//
//  ThirdView.swift
//  SimpleNavigation
//
//  Created by Juan Catalan on 7/7/23.
//

import SwiftUI

struct ThirdView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            Image(systemName: "triangle")
                .font(.system(size: 80))
                .foregroundStyle(.teal)
                .padding(.vertical, 50)
            Text("This is the Third View")
                .foregroundStyle(.primary)
                .padding()
        }
        .padding()
        .navigationTitle("Third")
        .navigationBarBackButtonHidden()
        .toolbar {
            Button("Dismiss") {
                dismiss()
            }
        }
        .toolbarBackground(.quaternary, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        ThirdView()
    }
}

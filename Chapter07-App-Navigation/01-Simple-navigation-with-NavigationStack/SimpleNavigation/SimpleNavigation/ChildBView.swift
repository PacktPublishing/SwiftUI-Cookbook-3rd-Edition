//
//  ChildBView.swift
//  SimpleNavigation
//
//  Created by Juan Catalan on 7/7/23.
//

import SwiftUI

struct ChildBView: View {
    var body: some View {
        VStack {
            Image(systemName: "b.square")
                .font(.system(size: 80))
                .foregroundStyle(.brown)
            Text("This is the Child B View")
                .foregroundStyle(.primary)
                .padding()
        }
        .navigationTitle("Child B")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChildBView()
    }
}

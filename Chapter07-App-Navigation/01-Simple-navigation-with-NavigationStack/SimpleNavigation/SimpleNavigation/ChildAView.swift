//
//  ChildAView.swift
//  SimpleNavigation
//
//  Created by Juan Catalan on 7/7/23.
//

import SwiftUI

struct ChildAView: View {
    @State private var title = "Child A"
    var body: some View {
        VStack {
            Image(systemName: "a.square")
                .font(.system(size: 80))
                .foregroundStyle(.yellow)
            Text("This is the Child A View")
                .foregroundStyle(.primary)
                .padding()
        }
        .navigationTitle($title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChildAView()
    }
}

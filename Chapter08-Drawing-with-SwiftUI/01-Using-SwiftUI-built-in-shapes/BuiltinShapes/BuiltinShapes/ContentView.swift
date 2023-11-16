//
//  ContentView.swift
//  BuiltinShapes
//
//  Created by Juan Catalan on 29/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Rectangle()
                .stroke(.orange,
                        lineWidth: 15)
            RoundedRectangle(cornerRadius: 20)
                .fill(.red)
            UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 50, bottomLeading: 35, bottomTrailing: 20, topTrailing: 0), style: .circular)
                .fill(.teal)
            Capsule(style: .continuous)
                .fill(.green)
                .frame(height: 100)
            Capsule(style: .circular)
                .fill(.yellow)
                .frame(height: 100)
            Circle()
                .strokeBorder(.blue, lineWidth: 15)
            Ellipse()
                .fill(.purple)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ContentView()
}

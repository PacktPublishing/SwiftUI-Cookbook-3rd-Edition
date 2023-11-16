//
//  ContentView.swift
//  MultipleAnimations
//
//  Created by Giordano Scalzo on 05/07/2021.
//

import SwiftUI

struct ContentView: View {
    @State var initialState = true

    var body: some View {
        VStack(spacing: 30) {
            Rectangle()
                .fill(initialState ? .blue : .red)
                .cornerRadius(initialState ? 50 : 0)
                .offset(y: initialState ? 0 : -200)
                .rotation3DEffect(
                    initialState ? .zero : .degrees(45),
                    axis: (x: 1, y: 0, z: 0)
                )
                .animation(.easeInOut(duration: 2), value: initialState)
                .scaleEffect(initialState ? 1 : 0.8)
                .rotationEffect(initialState ? .zero : .degrees(-90))
                .animation(.linear(duration: 1), value: initialState)
                .frame(width: 300, height: 200)
            Button {
                initialState.toggle()
            } label: {
                Text("Animate")
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.green)
                    .cornerRadius(5)
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  UIKitToSwiftUI
//
//  Created by Edgar Nzokwe on 7/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = true
    var body: some View {
        VStack {
            ActivityIndicator(animating: animate)
            HStack {
                Toggle(isOn: $animate) {
                    Text("Toggle Activity")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

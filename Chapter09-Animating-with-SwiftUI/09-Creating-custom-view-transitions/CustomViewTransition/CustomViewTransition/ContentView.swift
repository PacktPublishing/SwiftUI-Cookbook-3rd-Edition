//
//  ContentView.swift
//  CustomViewTransition
//
//  Created by Giordano Scalzo on 05/07/2021.
//

import SwiftUI

extension AnyTransition {
    static var moveScaleAndFade: AnyTransition {
        let insertion = AnyTransition
            .scale
            .combined(with: .move(edge: .leading))
            .combined(with: .opacity)
        let removal = AnyTransition
            .scale
            .combined(with: .move(edge: .top))
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

extension Image {
    func custom() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
            .shadow(radius: 10)
    }
}

struct FirstView: View {
    var body: some View {
        Image(.image1)
            .custom()
    }
}

struct SecondView: View {
    var body: some View {
        Image(.image2)
            .custom()
    }
}

struct ContentView: View {
    @State var showFirst = true
    var body: some View {
        VStack(spacing: 24) {
            if showFirst {
                FirstView()
                    .transition(.moveScaleAndFade)
            } else {
                SecondView()
                    .transition(.moveScaleAndFade)
            }
            Button {
                showFirst.toggle()
            } label: {
                Text("Change")
            }
        }
        .animation(Animation.easeInOut, value: showFirst)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ContentView()
}

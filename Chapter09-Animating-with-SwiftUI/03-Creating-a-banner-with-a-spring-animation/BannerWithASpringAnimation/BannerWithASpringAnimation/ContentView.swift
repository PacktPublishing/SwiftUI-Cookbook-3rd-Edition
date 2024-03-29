//
//  ContentView.swift
//  BannerWithASpringAnimation
//
//  Created by Giordano Scalzo on 05/07/2021.
//
import SwiftUI

struct BannerView: View {
    let message: String
    var show: Bool

    var body: some View {
        Text(message)
            .font(.title)
            .frame(width: UIScreen.main.bounds.width - 20,
                   height: 100)
            .foregroundStyle(.white)
            .background(Color.green)
            .cornerRadius(10)
            .offset(y: show ?
                    -UIScreen.main.bounds.height / 3 :
                        -UIScreen.main.bounds.height)
            .animation(
                .interpolatingSpring(
                    duration: 0.888,
                    bounce: 0.646
                ),
                value: show
            )
    }
}

struct ContentView: View {
    @State var show = false

    var body: some View {
        VStack {
            BannerView(message: "Hello, World!", show: show)
            Button {
                show.toggle()
            } label: {
                Text(show ? "Hide" : "Show")
                    .padding()
                    .frame(width: 100)
                    .foregroundColor(.white)
                    .background(show ? .red : .blue)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    ContentView()
}

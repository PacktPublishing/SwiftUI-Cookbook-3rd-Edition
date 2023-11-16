//
//  ContentView.swift
//  CustomAnimations
//
//  Created by Juan Catalan on 7/28/23.
//

import SwiftUI

private struct AnimationValues {
    var verticalOffset = 0.0
    var verticalStretch = 0.8
    var shadowScale = 1.0
}

struct ContentView: View {
    @State var animate = false
    var body: some View {
        VStack(spacing: 60) {
            KeyframeAnimator(initialValue: AnimationValues(), repeating: animate) { value in
                ZStack {
                    Ellipse()
                        .foregroundStyle(.gray)
                        .frame(width: 60 * value.shadowScale, height: 20 * value.shadowScale)
                        .offset(y: 30)
                    Image(systemName: "basketball.fill")
                        .resizable()
                        .foregroundStyle(.orange)
                        .background(.black)
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                        .scaleEffect(y: value.verticalStretch, anchor: .bottom)
                        .offset(y: value.verticalOffset)
                }
            } keyframes: { _ in
                KeyframeTrack(\.verticalStretch) {
                    SpringKeyframe(0.8, duration: 0.15)
                    CubicKeyframe(1.0, duration: 0.2)
                    CubicKeyframe(1.2, duration: 0.8)
                    CubicKeyframe(1.0, duration: 0.2)
                    SpringKeyframe(0.8, duration: 0.15)
                }
                KeyframeTrack(\.verticalOffset) {
                    CubicKeyframe(0, duration: 0.2)
                    CubicKeyframe(-120, duration: 0.4)
                    CubicKeyframe(-120, duration: 0.4)
                    CubicKeyframe(0, duration: 0.5)
                }
                KeyframeTrack(\.shadowScale) {
                    CubicKeyframe(1, duration: 0.2)
                    CubicKeyframe(0.6, duration: 0.4)
                    CubicKeyframe(0.6, duration: 0.4)
                    CubicKeyframe(1, duration: 0.5)
                }
            }
            Button {
                animate.toggle()
            } label: {
                Text(animate ? "Stop" : "Animate")
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .frame(width: 100)
                    .background(animate ? .red : .green)
                    .cornerRadius(5.0)
            }
        }
    }
}

#Preview {
    ContentView()
}

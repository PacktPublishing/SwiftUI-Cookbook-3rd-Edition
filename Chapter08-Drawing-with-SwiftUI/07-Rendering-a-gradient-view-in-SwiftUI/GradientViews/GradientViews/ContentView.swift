//
//  ContentView.swift
//  GradientViews
//
//  Created by Juan Catalan on 30/06/2023.
//

import SwiftUI

extension Text {
    func bigLight() -> some View {
        font(.system(size: 80))
            .fontWeight(.thin)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
    }
}

struct LinearGradientView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient:
                    Gradient(colors:
                                [.orange, .green,
                                 .blue, .black]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            Text("Linear Gradient")
                .bigLight()
        }
    }
}

struct RadialGradientView: View {
    var body: some View {
        ZStack {
            RadialGradient(
                gradient:
                    Gradient(colors:
                                [.orange, .green,
                                 .blue, .black]),
                center: .center,
                startRadius: 20,
                endRadius: 500)
            Text("Radial Gradient")
                .bigLight()
        }
    }
}

struct EllipticalGradientView: View {
    var body: some View {
        ZStack {
            EllipticalGradient(
                gradient: Gradient(colors:
                                    [.orange, .green,
                                     .blue, .black]),
                center: .center,
                startRadiusFraction: 0,
                endRadiusFraction: 0.75)
            Text("Elliptical Gradient")
                .bigLight()
        }
    }
}

struct AngularGradientView: View {
    var body: some View {
        ZStack {
            AngularGradient(
                gradient:
                    Gradient(
                        colors: [.orange, .green, .blue, .black,
                                 .black, .blue, .green, .orange]),
                center: .center)
            Text("Angular Gradient")
                .bigLight()
        }
    }
}

struct ContentView: View {
    @State private var selectedGradient = 0
    @ViewBuilder var content: some View {
        switch selectedGradient {
        case 0:
            LinearGradientView()
        case 1:
            RadialGradientView()
        case 2:
            EllipticalGradientView()
        default:
            AngularGradientView()
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            content
                .edgesIgnoringSafeArea(.all)
            
            Picker(selection: $selectedGradient,
                   label: Text("Select Gradient")) {
                Text("Linear").tag(0)
                Text("Radial").tag(1)
                Text("Elliptical").tag(2)
                Text("Angular").tag(3)
            }
                   .pickerStyle(SegmentedPickerStyle())
                   .padding(.horizontal, 32)
        }
    }
}

#Preview {
    ContentView()
}

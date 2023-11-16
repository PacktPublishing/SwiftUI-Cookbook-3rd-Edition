//
//  ContentView.swift
//  UsingSFSymbols
//
//  Created by Juan Catalan on 6/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var wifiSelection = 0
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "c")
                Image(systemName: "o")
                Image(systemName: "o")
                Image(systemName: "k")
            }
            .symbolVariant(.fill.circle)
            .foregroundStyle(.yellow, .blue)
            .font(.title)
            HStack {
                Image(systemName: "b.circle.fill")
                Image(systemName: "o.circle.fill")
                    .foregroundStyle(.red)
                Image(systemName: "o.circle.fill")
                    .imageScale(.large)
                Image(systemName: "k.circle.fill")
                    .accessibility(identifier: "Letter K")
            }
            .foregroundStyle(.blue)
            .font(.title)
            .padding()
            HStack {
                Image(systemName: "allergens")
                Image(systemName: "ladybug")
            }
            .symbolVariant(.fill)
            .symbolRenderingMode(.multicolor)
            .font(.largeTitle)
            HStack {
                Picker("Pick One", selection: $wifiSelection) {
                    Text("No Wifi").tag(0)
                    Text("Searching").tag(1)
                    Text("Wifi On").tag(2)
                }
                .pickerStyle(.segmented)
                .frame(width: 240)
                .padding(.horizontal)
                Group {
                    switch wifiSelection {
                    case 0:
                        Image(systemName: "wifi")
                            .symbolVariant(.slash)
                    case 1:
                        Image(systemName: "wifi")
                            .symbolEffect(.variableColor.iterative.reversing)
                    default:
                        Image(systemName: "wifi")
                            .foregroundStyle(.blue)
                    }
                }
                .foregroundStyle(.secondary)
                .font(.title)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

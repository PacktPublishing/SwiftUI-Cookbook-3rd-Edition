//
//  ContentView.swift
//  DisplayingContextMenus
//
//  Created by Edgar Nzokwe on 9/13/21.
//

import SwiftUI

struct ContentView: View {
    @State private var bulbColor = Color.red
    var body: some View {
        Image(systemName: "lightbulb.fill")
            .font(.system(size: 60))
            .foregroundStyle(bulbColor)
            .contextMenu {
                Button("Yellow Bulb") {
                    bulbColor = .yellow
                }
                Button("Blue Bulb") {
                    bulbColor = .blue
                }
                Button("Green Bulb") {
                    bulbColor = .green
                }
            }
    }
}

#Preview {
    ContentView()
}

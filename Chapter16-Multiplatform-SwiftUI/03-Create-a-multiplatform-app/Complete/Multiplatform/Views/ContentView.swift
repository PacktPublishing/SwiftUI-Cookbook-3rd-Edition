//
//  ContentView.swift
//  Multiplatform
//
//  Created by Juan Catalan on 10/3/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(InsectData.self) private var insectData: InsectData
    var body: some View {
        NavigationSplitView {
            #if os(macOS)
            Text("Insects")
                .font(.title2)
                .toolbar(.hidden, for: .windowToolbar)
                .navigationSplitViewColumnWidth(min: 240, ideal: 240, max: 480)
            #endif
            InsectListView()
        } detail: {
            ContentUnavailableView(
                "Choose an insect from the list",
                systemImage: "hand.point.up.left"
            )
        }
    }
}

#Preview {
    ContentView()
        .environment(InsectData())
}

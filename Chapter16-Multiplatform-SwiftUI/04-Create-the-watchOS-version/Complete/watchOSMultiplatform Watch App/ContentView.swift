//
//  ContentView.swift
//  watchOSMultiplatform Watch App
//
//  Created by Juan Catalan on 10/11/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(InsectData.self) private var insectData: InsectData
    var body: some View {
        NavigationStack {
            InsectListView()
                .environment(InsectData())
        }
    }
}

#Preview {
    ContentView()
        .environment(InsectData())
}

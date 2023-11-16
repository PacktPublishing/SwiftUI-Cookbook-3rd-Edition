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
        NavigationStack {
            InsectListView()
        }
    }
}

#Preview {
    ContentView()
        .environment(InsectData())
}

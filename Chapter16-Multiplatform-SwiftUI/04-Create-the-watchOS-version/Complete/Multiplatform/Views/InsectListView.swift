//
//  InsectListView.swift
//  Multiplatform
//
//  Created by Juan Catalan on 10/4/23.
//

import SwiftUI

struct InsectListView: View {
    @Environment(InsectData.self) private var insectData: InsectData
    var body: some View {
        List {
            ForEach(insectData.insects) { insect in
                NavigationLink(value: insect) {
                    #if os(watchOS)
                    WatchInsectCellView(insect: insect)
                    #else
                    InsectCellView(insect: insect)
                    #endif
                }
            }
        }
        .navigationDestination(for: Insect.self) { insect in
            #if os(watchOS)
            WatchInsectDetailView(insect: insect)
            #else
            InsectDetailView(insect: insect)
            #endif
        }
        .navigationTitle("Insects")
    }
}

#Preview {
    NavigationStack {
        InsectListView()
            .environment(InsectData())
    }
}

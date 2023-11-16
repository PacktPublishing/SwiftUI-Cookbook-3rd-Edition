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
            ForEach(insectData.insects) {insect in
                NavigationLink(value: insect) {
                    InsectCellView(insect: insect)
                }
            }
        }
        .navigationDestination(for: Insect.self) { insect in
            InsectDetailView(insect: insect)
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

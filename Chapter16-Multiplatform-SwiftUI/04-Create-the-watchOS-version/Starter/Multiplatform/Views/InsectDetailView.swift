//
//  InsectDetailView.swift
//  Multiplatform
//
//  Created by Juan Catalan on 10/4/23.
//

import SwiftUI

struct InsectDetailView: View {
    var insect: Insect
    var body: some View {
        VStack(alignment: .leading) {
            #if os(macOS)
            Text(insect.name)
                .font(.largeTitle)
                .padding(.horizontal)
            #endif
            ScrollView {
                VStack(alignment: .leading) {
                    Image(insect.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("Habitat")
                        .font(.title)
                    Text(insect.habitat)
                    Text("Description")
                        .font(.title)
                    Text(insect.description)
                }
                .padding(.horizontal)
            }
            #if os(iOS)
            .navigationTitle(insect.name)
            #endif
        }
    }
}

#Preview {
    NavigationStack {
        InsectDetailView(insect: .oneInsect)
    }
}

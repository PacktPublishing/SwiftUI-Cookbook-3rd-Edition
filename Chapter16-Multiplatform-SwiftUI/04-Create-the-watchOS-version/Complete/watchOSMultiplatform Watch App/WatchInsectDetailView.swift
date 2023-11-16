//
//  WatchInsectDetailView.swift
//  watchOSMultiplatform Watch App
//
//  Created by Juan Catalan on 10/11/23.
//

import SwiftUI

struct WatchInsectDetailView: View {
    var insect: Insect
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                VStack(alignment: .leading) {
                    Image(insect.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("Habitat")
                        .foregroundStyle(Color.accentColor)
                    Text(insect.habitat)
                    Text("Description")
                        .foregroundStyle(Color.accentColor)
                    Text(insect.description)
                }
                .padding(.horizontal)
            }
            .navigationTitle(insect.name)
        }
    }
}

#Preview {
    NavigationStack {
        WatchInsectDetailView(insect: .oneInsect)
    }
}

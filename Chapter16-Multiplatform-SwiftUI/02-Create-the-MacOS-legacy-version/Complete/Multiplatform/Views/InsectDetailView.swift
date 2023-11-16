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
            Text(insect.name)
                .font(.largeTitle)
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
}

#Preview {
    InsectDetailView(insect: .oneInsect)
}

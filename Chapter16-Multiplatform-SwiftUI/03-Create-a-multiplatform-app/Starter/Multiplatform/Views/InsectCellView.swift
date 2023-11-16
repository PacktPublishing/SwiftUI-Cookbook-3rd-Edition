//
//  InsectCellView.swift
//  Multiplatform
//
//  Created by Juan Catalan on 10/3/23.
//

import SwiftUI

struct InsectCellView: View {
    var insect: Insect
    var body: some View {
        HStack {
            Image(insect.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Rectangle())
                .frame(width: 100, height: 80)
            VStack(alignment: .leading) {
                Text(insect.name)
                    .font(.title)
                Text(insect.habitat)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    InsectCellView(insect: .oneInsect)
}

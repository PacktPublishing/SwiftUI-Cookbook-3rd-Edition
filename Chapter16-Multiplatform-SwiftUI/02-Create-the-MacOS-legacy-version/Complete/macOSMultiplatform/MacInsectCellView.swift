//
//  MacInsectCellView.swift
//  macOSMultiplatform
//
//  Created by Juan Catalan on 10/9/23.
//

import SwiftUI

struct MacInsectCellView: View {
    var insect: Insect
    var body: some View {
        HStack {
            Image(insect.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Rectangle())
                .frame(width: 160, height: 100)
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
    MacInsectCellView(insect: .oneInsect)
}

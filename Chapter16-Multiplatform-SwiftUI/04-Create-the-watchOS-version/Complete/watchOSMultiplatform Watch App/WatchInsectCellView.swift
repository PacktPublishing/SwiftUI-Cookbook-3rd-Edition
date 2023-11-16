//
//  WatchInsectCellView.swift
//  watchOSMultiplatform Watch App
//
//  Created by Juan Catalan on 10/11/23.
//

import SwiftUI

struct WatchInsectCellView: View {
    var insect: Insect
    var body: some View {
        VStack(alignment: .leading) {
            Image(insect.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(insect.name)
                .font(.title2)
            Text(insect.habitat)
        }
    }
}

#Preview {
    List {
        WatchInsectCellView(insect: .oneInsect)
    }
}

//
//  ContentView.swift
//  UsingMockDataForPreviews
//
//  Created by Juan Catalan on 6/29/23.
//

import SwiftUI

struct ContentView: View {
    var insects: [Insect] = []
    var body: some View {
        NavigationStack {
            List {
                ForEach(insects) {insect in
                    HStack {
                        Image(insect.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Rectangle())
                            .frame(width: 100, height: 80)
                        VStack(alignment: .leading) {
                            Text(insect.name).font(.title)
                            Text(insect.habitat)
                        }
                        .padding(.vertical)
                    }
                }
            }
            .navigationTitle("Insects")
        }
    }
}

#Preview {
    let testInsect = Insect(id: 1, imageName: "grasshopper", name: "grass", habitat: "rocks", description: "none")
    let testInsects: [Insect] = {
        guard let url = Bundle.main.url(forResource: "insectData", withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else {
            return []
        }
        let decoder  = JSONDecoder()
        let array = try?decoder.decode([Insect].self, from: data)
        return array ??  [testInsect]
    }()
    return ContentView(insects: testInsects)
}

//
//  Insect.swift
//  Multiplatform
//
//  Created by Juan Catalan on 10/3/23.
//

import Foundation

struct Insect: Decodable, Identifiable, Hashable {
    var id: Int
    var imageName: String
    var name: String
    var habitat: String
    var description: String
}

extension Insect {
    static var oneInsect = Insect(
        id: 1,
        imageName: "grasshopper",
        name: "grass",
        habitat: "pond",
        description: "long description here"
    )
    
    static var manyInsects: [Insect] = {
        guard let url = Bundle.main.url(
            forResource: "insectData",
            withExtension: "json"
        ),
              let data = try? Data(contentsOf: url)
        else {
            return []
        }
        let decoder  = JSONDecoder()
        let array = try?decoder.decode([Insect].self, from: data)
        return array ??  [oneInsect]
    }()
}

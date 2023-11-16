//
//  Insect.swift
//  UsingMockDataForPreviews
//
//  Created by Juan Catalan on 6/29/23.
//

import Foundation

struct Insect: Decodable, Identifiable {
    var id: Int
    var imageName: String
    var name: String
    var habitat: String
    var description: String
}

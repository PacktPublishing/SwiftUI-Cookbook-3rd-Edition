//
//  Priority.swift
//  Reminders
//
//  Created by Juan Catalan on 8/3/23.
//

import Foundation

enum Priority: String, CaseIterable, CustomStringConvertible {
    case none
    case low
    case medium
    case high
    
    var description: String {
        self.rawValue.capitalized
    }

    var shortDescription: String {
        switch self {
        case .none: ""
        case .low: "!"
        case .medium: "!!"
        case .high: "!!!"
        }
    }
    
    static let allDescriptions = Self.allCases.map { $0.description }
}

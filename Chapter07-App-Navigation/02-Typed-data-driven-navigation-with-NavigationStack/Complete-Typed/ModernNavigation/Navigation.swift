//
//  Navigation.swift
//  ModernNavigation
//
//  Created by Juan Catalan on 7/11/23.
//

import Foundation

final class Navigation: ObservableObject {
    @Published var path: [Food] = .init()
    
    func popToRoot() {
        path = .init()
    }
}

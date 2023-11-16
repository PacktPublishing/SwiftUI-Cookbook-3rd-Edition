//
//  Navigation.swift
//  ModernNavigation
//
//  Created by Juan Catalan on 7/11/23.
//

import Foundation
import SwiftUI

final class Navigation: ObservableObject {
    @Published var path = NavigationPath()
    
    func popToRoot() {
        path = .init()
    }
}

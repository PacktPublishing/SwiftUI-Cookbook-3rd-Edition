//
//  MultiplatformApp.swift
//  Multiplatform
//
//  Created by Juan Catalan on 10/8/23.
//

import SwiftUI

@main
struct MultiplatformApp: App {
    @State private var insectData = InsectData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(insectData)
        }
    }
}

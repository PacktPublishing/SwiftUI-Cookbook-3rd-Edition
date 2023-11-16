//
//  macOSMultiplatformApp.swift
//  macOSMultiplatform
//
//  Created by Juan Catalan on 10/9/23.
//

import SwiftUI

@main
struct macOSMultiplatformApp: App {
    @State private var insectData = InsectData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(insectData)
        }
    }
}

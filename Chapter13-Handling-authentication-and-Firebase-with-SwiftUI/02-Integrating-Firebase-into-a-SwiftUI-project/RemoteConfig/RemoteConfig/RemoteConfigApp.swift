//
//  RemoteConfigApp.swift
//  RemoteConfig
//
//  Created by Juan Catalan on 8/15/23.
//

import SwiftUI
import Firebase

@main
struct RemoteConfigApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

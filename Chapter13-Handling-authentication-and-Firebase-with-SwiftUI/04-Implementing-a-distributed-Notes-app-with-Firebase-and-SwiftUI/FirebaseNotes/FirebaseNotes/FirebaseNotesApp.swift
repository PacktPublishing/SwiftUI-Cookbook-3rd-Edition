//
//  FirebaseNotesApp.swift
//  FirebaseNotes
//
//  Created by Juan Catalan on 8/21/23.
//

/*
 
 Don't forget to add your GoogleService-Info.plist to the project or the app won't work
 
 */

import SwiftUI
import Firebase

@main
struct FirebaseNotesApp: App {    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

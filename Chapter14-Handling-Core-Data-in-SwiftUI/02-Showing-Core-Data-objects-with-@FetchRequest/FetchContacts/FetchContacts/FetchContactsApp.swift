//
//  FetchContactsApp.swift
//  FetchContacts
//
//  Created by Giordano Scalzo on 01/09/2021.
//

import SwiftUI

@main
struct FetchContactsApp: App {
    private let coreDataStack = CoreDataStack(modelName: "ContactsModel")
    @AppStorage("appHasData") var appHasData = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataStack.managedObjectContext)
                .onAppear {
                    if !appHasData {
                        coreDataStack.addContacts()
                        appHasData = true
                    }
                }
        }
    }
}

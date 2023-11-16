//
//  DeleteContactsApp.swift
//  DeleteContacts
//
//  Created by Giordano Scalzo on 03/09/2021.
//

import SwiftUI

@main
struct DeleteContactsApp: App {
    private let coreDataStack = CoreDataStack(modelName: "ContactsModel")
    @AppStorage("appHasData") var appHasData = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataStack.managedObjectContext)
                .environmentObject(coreDataStack)
                .onAppear {
                    if !appHasData {
                        coreDataStack.addContacts()
                        appHasData = true
                    }
                }
        }
    }
}

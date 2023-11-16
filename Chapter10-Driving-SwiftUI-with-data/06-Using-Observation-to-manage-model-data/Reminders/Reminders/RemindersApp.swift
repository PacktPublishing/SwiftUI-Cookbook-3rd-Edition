//
//  RemindersApp.swift
//  Reminders
//
//  Created by Juan Catalan on 8/3/23.
//

import SwiftUI

@main
struct RemindersApp: App {
    @State private var storage = Storage(reminders: Reminder.samples)

    var body: some Scene {
        WindowGroup {
            ReminderListView()
                .environment(\.storage, storage)
        }
    }
}

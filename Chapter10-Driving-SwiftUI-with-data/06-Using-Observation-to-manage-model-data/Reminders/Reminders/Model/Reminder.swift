//
//  Reminder.swift
//  Reminders
//
//  Created by Juan Catalan on 8/3/23.
//

import SwiftUI

@Observable final class Reminder: NSObject, Identifiable {
    var title: String
    var notes: String
    var flag: Bool
    var priority: Priority
    
    init(
        title: String,
        notes: String = "",
        flag: Bool = false,
        priority: Priority = .none
    ) {
        self.title = title
        self.notes = notes
        self.flag = flag
        self.priority = priority
    }
    
    var isEmpty: Bool {
        title.isEmpty
    }
}

extension Reminder {
    static let sample = Reminder(title: "Write chapter 10", notes: "Add new section about Observation", flag: true, priority: .high)
    static let samples = [
        sample,
        Reminder(title: "Cut the grass", priority: .medium),
        Reminder(title: "Buy new iPhone", notes: "Wait until the relase in September", priority: .high),
        Reminder(title: "Renew passport", notes: "Expires on May 15", priority: .low),
        Reminder(title: "Inflate car tires"),
        Reminder(title: "Replace light bulb in the kitchen", notes: "Honey due", priority: .medium),
        Reminder(title: "Buy wine", flag: true)
    ]
}

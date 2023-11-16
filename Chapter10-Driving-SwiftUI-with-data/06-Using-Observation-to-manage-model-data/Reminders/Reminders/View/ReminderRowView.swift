//
//  ReminderRowView.swift
//  Reminders
//
//  Created by Juan Catalan on 8/3/23.
//

import SwiftUI

struct ReminderRowView: View {
    @Bindable var reminder: Reminder
    @FocusState private var isFocused: Bool
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if reminder.priority != .none {
                    Text(reminder.priority.shortDescription)
                        .foregroundStyle(.blue)
                }
                TextField("New Reminder", text: $reminder.title)
                    .focused($isFocused)
                Spacer()
                if reminder.flag {
                    Image(systemName: "flag.fill")
                        .foregroundStyle(.orange)
                }
            }
            Text(reminder.notes)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .lineLimit(3)
        }
        .onAppear {
            if reminder.isEmpty {
                isFocused = true
            }
        }
    }
}

#Preview {
    ReminderRowView(reminder: .sample)
}

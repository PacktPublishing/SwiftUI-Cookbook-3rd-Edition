//
//  ReminderView.swift
//  Reminders
//
//  Created by Juan Catalan on 8/3/23.
//

import SwiftUI

struct ReminderView: View {
    @Bindable var reminder: Reminder
    
    private var titleNotesView: some View {
        Group {
            TextField("Title", text: $reminder.title)
                .padding(.horizontal, 5)
            ZStack(alignment: .topLeading) {
                if reminder.notes.isEmpty {
                    Text("Notes")
                        .foregroundStyle(.placeholder)
                        .padding(.horizontal, 5)
                        .padding(.top, 8)
                }
                TextEditor(text: $reminder.notes)
                    .frame(maxHeight: 100)
            }
        }
    }
    
    private var flagToggleView: some View {
        Toggle(isOn: $reminder.flag) {
            HStack {
                Image(systemName: reminder.flag ? "flag.fill" : "flag")
                    .foregroundStyle(.orange)
                Text("Flag")
            }
        }
    }
    
    @State private var priorityDescription = Priority.none.description

    private var priorityPicker: some View {
        Picker("Priority", selection: $priorityDescription) {
            ForEach(Priority.allDescriptions, id:\.self) { description in
                Text(description)
                if description == Priority.none.description {
                    Divider()
                }
            }
        }
        .onAppear {
            priorityDescription = reminder.priority.description
        }
        .onChange(of: priorityDescription) { _, newValue in
            let priority = Priority(rawValue: newValue.lowercased())!
            $reminder.priority.wrappedValue = priority
        }
    }
    
    var body: some View {
        Form {
            Section {
                titleNotesView
            }
            Section {
                flagToggleView
            }
            Section {
                priorityPicker
            }
        }
    }
}

#Preview {
    ReminderView(reminder: .sample)
}

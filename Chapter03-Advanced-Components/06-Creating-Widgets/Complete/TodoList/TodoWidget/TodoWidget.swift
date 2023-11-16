//
//  TodoWidget.swift
//  TodoWidget
//
//  Created by Juan Catalan on 6/26/23.
//

import WidgetKit
import SwiftUI

struct TaskEntry: TimelineEntry {
    let date: Date
    let task: Task
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> TaskEntry {
        TaskEntry(date: Date(), task: .task)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TaskEntry) -> Void) {
        let entry = TaskEntry(date: Date(), task: .task)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [TaskEntry] = []
        let currentDate = Date()
        let filteredTasks = Task.tasks.sorted(by: {$0.priority > $1.priority})
        for index in 0..<filteredTasks.count {
            let task = filteredTasks[index]
            let entryDate = Calendar.current.date(byAdding: .second, value: index*10, to: currentDate)!
            let entry = TaskEntry(date: entryDate, task: task)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct TodoWidgetEntryView: View {
    var entry: Provider.Entry
    var body: some View {
        VStack {
            Image(systemName: imageName(forTask: entry.task))
            Text(entry.task.description)
        }.containerBackground(for: .widget) {
            Color(.widgetBackground)
        }
    }
    private func imageName(forTask task: Task) -> String {
        switch task.priority {
        case .high: "arrowshape.up.circle"
        case .medium: "arrowshape.forward.circle"
        case .low: "arrowshape.down.circle"
        }
    }
}

struct TodoWidget: Widget {
    let kind: String = "TodoWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider()) { entry in
                TodoWidgetEntryView(entry: entry)
            }
            .configurationDisplayName("Task List Widget")
            .description("Shows next pressing item on a todo list")
            .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview("small", as: .systemSmall) {
    TodoWidget()
} timelineProvider: {
    Provider()
}

#Preview("medium", as: .systemMedium) {
    TodoWidget()
} timeline: {
    TaskEntry(date: Date(), task: Task(completed: false, description: "Wake up", priority: .low))
    TaskEntry(date: Date(), task: Task(completed: false, description: "Shower", priority: .medium))
    TaskEntry(date: Date(), task: Task(completed: false, description: "Code", priority: .high))
}

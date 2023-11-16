//
//  TaskListView.swift
//  TodoList
//
//  Created by Edgar Nzokwe on 8/16/21.
//

import SwiftUI

struct TaskListView: View {
    @Binding var tasks: [Task]
    var body: some View {
        NavigationStack {
            List {
                ForEach($tasks) { task in
                    TaskView(task: task)
                }
            }.navigationTitle(Text("To do list"))
        }
    }
}

#Preview {
    @State var tasks = Task.tasks
    return TaskListView(tasks: $tasks)
}

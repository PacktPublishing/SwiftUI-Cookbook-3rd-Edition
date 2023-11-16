//
//  ContentView.swift
//  TodoList
//
//  Created by Edgar Nzokwe on 8/15/21.
//

import SwiftUI

struct ContentView: View {
    @State var tasks = Task.tasks
    var body: some View {
        TaskListView(tasks: $tasks)
    }
}

#Preview {
    ContentView()
}

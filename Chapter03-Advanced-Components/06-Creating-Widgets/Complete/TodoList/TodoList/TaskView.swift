//
//  TaskView.swift
//  TodoList
//
//  Created by Edgar Nzokwe on 8/15/21.
//

import SwiftUI

struct TaskView: View {
    @Binding var task: Task
    var body: some View {
        HStack {
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(task.completed ? Color(UIColor.systemBlue) : Color.secondary)
                        .onTapGesture {
                            self.task.completed.toggle()
                        }

            Text(task.description)
                .font(.title2)
                .padding()
            Spacer()
        }.padding()
    }
}

#Preview {
    @State var task = Task.task
    return TaskView(task: $task)
}

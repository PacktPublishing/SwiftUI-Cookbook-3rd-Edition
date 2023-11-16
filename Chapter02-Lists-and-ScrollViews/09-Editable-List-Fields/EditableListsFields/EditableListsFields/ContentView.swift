//
//  ContentView.swift
//  EditableListsFields
//
//  Created by Edgar Nzokwe on 8/1/21.
//

import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
}

struct ContentView: View {
    @State private var todos = [
        TodoItem(title: "Eat"),
        TodoItem(title: "Sleep"),
        TodoItem(title: "Code")
    ]

    var body: some View {
        List($todos) { $todo in
            TextField("Todo Item", text: $todo.title)
      }
    }
}

#Preview {
    ContentView()
}

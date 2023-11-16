//
//  ContentView.swift
//  MarkdownEditor
//
//  Created by Giordano Scalzo on 22/09/2021.
//

import SwiftUI

struct FormatButton: View {
    let label: String
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Text(.init(label))
                .frame(width:30)
        }
        .buttonStyle(.bordered)
    }
}

struct FormatBar: View {
    @Binding var text: String
    var body: some View {
        HStack {
            FormatButton(label: "**B**") {
                text += "**"
            }
            FormatButton(label: "*I*") {
                text += "*"
            }
            FormatButton(label: "***B***") {
                text += "***"
            }
            FormatButton(label: "~~S~~") {
                text += "~~"
            }
            FormatButton(label: "`C`") {
                text += "`"
            }
        }
    }
}

struct EditorView: View {
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading) {
            FormatBar(text: $text)
            TextEditor(text: $text)
                .font(.title)
        }
    }
}

struct PreviewView: View {
    var text: String
    var body: some View {
        VStack {
            Text(.init(text))
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
    }
}


struct ContentView: View {
    @State private var isEditMode = true
    @State private var text = ""
    
    var body: some View {
        VStack {
            Picker("Choose mode", selection: $isEditMode) {
                Text("Editor").tag(true)
                Text("Preview").tag(false)
            }
            .pickerStyle(.segmented)
            if isEditMode {
                EditorView(text: $text)
            } else {
                PreviewView(text: text)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}

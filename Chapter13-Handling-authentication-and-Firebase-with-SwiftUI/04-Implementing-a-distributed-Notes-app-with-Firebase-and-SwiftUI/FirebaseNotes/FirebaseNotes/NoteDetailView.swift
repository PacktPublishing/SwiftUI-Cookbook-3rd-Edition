//
//  NoteDetailView.swift
//  NoteDetailView
//
//  Created by Juan Catalan on 8/21/23.
//

import SwiftUI

struct NoteDetailView: View {
    let note: Note
    var body: some View {
        VStack(spacing: 12) {
            Text(note.title)
                .font(.headline)
                .fontWeight(.bold)
            TextEditor(text: .constant(note.body))
                .border(.gray)
        }
        .padding(24)
    }
}

#Preview {
    NoteDetailView(note: Note.sampleWithLongBody)
}


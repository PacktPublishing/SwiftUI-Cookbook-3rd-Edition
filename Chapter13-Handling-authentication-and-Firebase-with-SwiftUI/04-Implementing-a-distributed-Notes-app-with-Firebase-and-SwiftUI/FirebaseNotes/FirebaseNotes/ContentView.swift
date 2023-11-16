//
//  ContentView.swift
//  FirebaseNotes
//
//  Created by Juan Catalan on 8/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var service: NotesService = NotesService()
    @State private var isNewNotePresented = false
    
    var body: some View {
        NavigationStack {
            List(service.notes) { note in
                NavigationLink(value: note) {
                    NoteSummaryView(note: note)
                }
            }
            .navigationDestination(for: Note.self) { note in
                NoteDetailView(note: note)
            }
            .navigationTitle("FireNotes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    isNewNotePresented.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(.headline)
                }
            }
            .sheet(isPresented: $isNewNotePresented) {
                AddNoteView(service: service)
            }
            .task {
                service.fetch()
            }
        }
    }
}

#Preview {
    ContentView()
}

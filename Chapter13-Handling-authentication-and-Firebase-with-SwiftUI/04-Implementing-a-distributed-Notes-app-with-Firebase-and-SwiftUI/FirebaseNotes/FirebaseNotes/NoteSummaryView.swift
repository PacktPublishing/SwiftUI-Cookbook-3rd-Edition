//
//  NoteSummaryView.swift
//  FirebaseNotes
//
//  Created by Juan Catalan on 8/21/23.
//

import SwiftUI

struct NoteSummaryView: View {
    private let format: Date.FormatStyle =
        .dateTime.month(.wide).day().year()
    var note: Note
    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.headline)
                .fontWeight(.bold)
            Text("\(note.date, format: format)")
                .font(.subheadline)
        }
    }
}

#Preview {
    List(0 ..< 5) { item in
        NoteSummaryView(note: Note.sample)
    }
}

//
//  SheetView.swift
//  SheetView
//
//  Created by Juan Catalan on 6/16/23.
//

import SwiftUI

struct SheetView: View {
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            Text("This is the sheet we want to display")
        }
    }
}

#Preview {
    SheetView()
}

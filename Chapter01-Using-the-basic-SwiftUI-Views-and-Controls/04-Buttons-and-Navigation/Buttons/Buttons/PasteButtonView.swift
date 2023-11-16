//
//  PasteButtonView.swift
//  ButtonsApp
//
//  Created by Juan Catalan on 4/30/23.
//

import SwiftUI

struct PasteButtonView: View {
    @State var text  = String()
    var body: some View {
        VStack {
            Text("PasteButton controls how you paste in macOS but is not available in iOS. For more information, check the \"See also\" section of this recipe")
                .padding()
        }
        .navigationTitle("PasteButton")
    }
}

#Preview {
    NavigationStack {
        PasteButtonView()
    }
}

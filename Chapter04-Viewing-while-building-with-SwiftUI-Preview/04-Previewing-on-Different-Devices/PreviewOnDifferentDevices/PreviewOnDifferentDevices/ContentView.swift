//
//  ContentView.swift
//  PreviewOnDifferentDevices
//
//  Created by Edgar Nzokwe on 8/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.friendship)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Importance of Friendship")
                .font(.title)
            Text("Friends helps us deal with stress and make better life choices")
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview("Friendship") {
    ContentView()
}

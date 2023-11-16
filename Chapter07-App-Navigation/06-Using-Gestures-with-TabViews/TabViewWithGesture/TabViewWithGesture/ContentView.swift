//
//  ContentView.swift
//  TabViewWithGesture
//
//  Created by Edgar Nzokwe on 9/6/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Left Tab. Tap to switch to right")
                .onTapGesture {
                    selectedTab = 1
                }
                .tabItem {
                    Label("Left", systemImage: "l.circle.fill")
                }
                .tag(0)
            Text("Right Tab. Tap to switch to left")
                .onTapGesture {
                    selectedTab = 0
                }
                .tabItem {
                    Label("Right",systemImage: "r.circle.fill")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

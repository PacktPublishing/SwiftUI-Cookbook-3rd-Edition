//
//  ContentView.swift
//  DisplayingPopovers
//
//  Created by Edgar Nzokwe on 9/17/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showPopover = false
    var body: some View {
        Button("Show popover") {
            showPopover = true
        }
        .font(.system(size: 40))
        .popover(isPresented: $showPopover) {
            Text("Popover content displayed here")
                .font(.system(size: 20))
                .padding()
        }
    }
}

// Use an iPad to see the popover, otherwise in the iPhone you'll get a sheet
#Preview {
    ContentView()
}

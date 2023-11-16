//
//  ContentView.swift
//  SwiftUICoreDataStack
//
//  Created by Giordano Scalzo on 01/09/2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        Text("\(managedObjectContext)")
    }
}

#Preview {
    ContentView()
}

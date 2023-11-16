//
//  ContentView.swift
//  AsyncAwaitSwiftUI
//
//  Created by Giordano Scalzo on 28/09/2021.
//

import SwiftUI

struct ContentView: View {
    private let service = Service()
    @State private var value: String = "-"
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text(value)
            Text("\(counter)")
            Button {
                counter += 1
            } label: {
                Text("increment")
            }
            .buttonStyle(.bordered)
        }
        .task {
            value = await service.fetchResult()
        }
    }
}

class Service {    
    func fetchResult() async -> String {
        try? await Task.sleep(for: .seconds(5))
        return "Result"
    }
}

#Preview {
    ContentView()
}

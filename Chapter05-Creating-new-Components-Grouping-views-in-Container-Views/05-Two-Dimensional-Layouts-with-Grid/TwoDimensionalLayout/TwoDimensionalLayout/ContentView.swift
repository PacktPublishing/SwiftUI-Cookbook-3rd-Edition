//
//  ContentView.swift
//  TwoDimensionalLayout
//
//  Created by Juan Catalan on 5/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid(horizontalSpacing: 5, verticalSpacing: 5) {
            GridRow {
                Text("My Awesome Grid")
                    .font(.largeTitle)
                    .gridCellColumns(7)
            }
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            GridRow {
                Color.clear.frame(width: 0, height: 0)
                ForEach(1..<7) { index in
                    Text("C\(index)")
                }
            }.frame(width: 45)
            GridRow {
                Text("R1")
                Color.clear.frame(width: 7.5, height: 7.5)
                    .border(.gray)
                Color.black.frame(width: 15, height: 15)
                    .gridColumnAlignment(.leading)
                Color.red.frame(width: 90, height: 90)
                Color.yellow.frame(width: 30, height: 30)
                    .gridCellAnchor(.bottomTrailing)
            }
            GridRow(alignment: .top) {
                Text("R2")
                ForEach(0..<5) { _ in Color.green.frame(width: 45, height: 45) }
                Color.green.frame(width: 15, height: 15)
                    .gridCellAnchor(.bottomLeading)
            }
            GridRow(alignment: .bottom) {
                Text("R3")
                Color.gray.frame(width: 15, height: 15)
                    .gridCellAnchor(.topLeading)
                ForEach(0..<2) { _ in Color.blue.frame(width: 30, height: 30) }
                Color.brown.frame(width: 45, height: 45)
                    .gridCellColumns(2)
                Color.gray.frame(width: 15, height: 15)
            }
        }
        .padding(5)
        .border(.gray)
    }
}

#Preview {
    ContentView()
        .previewLayout(.sizeThatFits)
}

//
//  HomeView.swift
//  UsingTabViews
//
//  Created by Juan Catalan on 7/20/23.
//

import SwiftUI

struct HomeView: View {
    let games = ["Doom", "Final F","Cyberpunk", "avengers", "animal trivia", "sudoku", "snakes and ladders", "Power rangers", "ultimate frisbee", "football", "soccer", "much more"]
    var body: some View {
        NavigationStack {
            List {
                ForEach(games, id: \.self){ game in
                    Text(game).padding()
                }
            }.navigationTitle("Best Games for 2021")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

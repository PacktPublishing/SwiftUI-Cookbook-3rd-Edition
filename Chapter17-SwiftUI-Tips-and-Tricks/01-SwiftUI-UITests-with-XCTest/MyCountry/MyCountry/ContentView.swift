//
//  ContentView.swift
//  MyCountry
//
//  Created by Juan Catalan on 10/14/23.
//

import SwiftUI

struct ContentView: View {
    static let countries = ["USA", "Spain", "France", "Italy"]
    @State private var selectedCountry: String = Self.countries[0]
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text("What is your country of origin?")
                .accessibilityIdentifier("Question")
            HStack(spacing: 12) {
                ForEach(Self.countries, id:\.self) { country in
                    let isSelected = selectedCountry == country
                    Button {
                        selectedCountry = country
                        counter += 1
                    } label: {
                        Text(country)
                            .frame(width: 80, height: 40)
                            .background((isSelected ? Color.red : .blue).opacity(0.6))
                            .cornerRadius(5)
                            .foregroundStyle(.white)
                    }
                    .accessibilityIdentifier(String(country.prefix(2)).uppercased())
                }
            }
            Spacer()
            Text(selectedCountry)
                .font(.system(size: 40))
                .accessibilityIdentifier("SelectedCountry")
            Spacer()
            HStack {
                Text("Number of taps: \(counter)")
                    .accessibilityIdentifier("NumberOfTaps")
                Spacer()
                Button("Reset") {
                    selectedCountry = Self.countries[0]
                    counter = 0
                }
                .buttonStyle(.bordered)
                .accessibilityIdentifier("Reset")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

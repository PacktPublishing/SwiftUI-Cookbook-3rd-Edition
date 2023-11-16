//
//  CurrenciesView.swift
//  UsingTabViews
//
//  Created by Juan Catalan on 7/20/23.
//

import SwiftUI

struct CurrenciesView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(Currency.currencies) { currency in
                    HStack {
                        Text(currency.name)
                        Spacer()
                        Image(systemName: currency.image)
                    }
                    .font(Font.system(size: 32, design: .default))
                    .padding()
                }
            }.navigationTitle("Currencies")
        }
    }
}

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesView()
    }
}

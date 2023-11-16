//
//  Greetings.swift
//  AddSwiftUIToUIKit
//
//  Created by Edgar Nzokwe on 7/19/21.
//

import SwiftUI

struct Greetings: View {
    var textFromUIKit: String
    var body: some View {
        Text(textFromUIKit)
    }
}

#Preview {
    Greetings(textFromUIKit: "Hello, World!")
}

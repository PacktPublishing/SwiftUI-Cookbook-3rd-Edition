//
//  Contact.swift
//  SwiftDataBasics
//
//  Created by Juan Catalan on 8/26/23.
//

import Foundation
import SwiftData

@Model final class Contact {
    var firstName: String
    var lastName: String
    var phoneNumber: String
    
    var fullName: String { firstName + " " + lastName }
    
    init(firstName: String, lastName: String, phoneNumber: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
}

extension Contact {
    static var samples: [Contact] = [
        ("Daenerys", "Targaryen", "02079460803"),
        ("Bran", "Stark", "02079460071"),
        ("Jon", "Snow", "02079460874"),
        ("Theon", "Greyjoy", "02890180771"),
        ("Ned", "Stark", "011774960111"),
        ("Tyrion", "Lannister", "02079460695"),
        ("Arya", "Stark", "02079460878"),
        ("Stannis", "Baratheon", "02079460367"),
        ("Samwell", "Tarly", "011774960104"),
        ("Jaime", "Lannister", "02890180239"),
        ("Jorah", "Mormont", "02079460025"),
        ("Jeor", "Mormont", "02079460127"),
        ("Robb", "Stark", "011774960384"),
        ("Joffrey", "Baratheon", "02079460963"),
        ("Tywin", "Lannister", "02890180899"),
        ("Margaery", "Tyrell", "011774960635"),
        ("Catelyn", "Stark", "02890180301"),
        ("Viserys", "Targaryen", "02079460220"),
        ("Cersei", "Lannister", "02890180492"),
        ("Davos", "Seaworth", "02079460848"),
        ("Sansa", "Stark", "02890180764")
    ].map { firstName, lastName, phoneNumber in
        Contact(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber)
    }
}

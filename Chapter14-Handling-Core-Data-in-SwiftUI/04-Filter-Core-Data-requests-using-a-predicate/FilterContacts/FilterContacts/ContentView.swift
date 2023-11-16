//
//  ContentView.swift
//  FilterContacts
//
//  Created by Giordano Scalzo on 03/09/2021.
//

import SwiftUI

struct ContactView: View {
    let contact: Contact
    var body: some View {
        HStack {
            Text(contact.firstName ?? "-")
            Text(contact.lastName ?? "-")
            Spacer()
            Text(contact.phoneNumber ?? "-")
        }
    }
}

struct FilteredContacts: View {
    let fetchRequest: FetchRequest<Contact>
    
    init(filter: String) {
        let predicate: NSPredicate? = filter.isEmpty ? nil : NSPredicate(format: "lastName BEGINSWITH[c] %@", filter)
        fetchRequest = FetchRequest<Contact>(
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Contact.lastName,
                                 ascending: true),
                NSSortDescriptor(keyPath: \Contact.firstName,
                                 ascending: true)
            ],
            predicate: predicate)
    }
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) {
            ContactView(contact: $0)
        }
        .listStyle(.plain)
    }
}

struct ContentView: View {
    @State private var searchText : String = ""
    
    var body: some View {
        NavigationStack {
            FilteredContacts(filter: searchText)
                .navigationTitle("Contacts")
                .navigationBarTitleDisplayMode(.inline)
        }
        .searchable(text: $searchText)
    }
}

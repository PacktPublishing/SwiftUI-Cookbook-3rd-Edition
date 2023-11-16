//
//  ContentView.swift
//  SwiftDataBasics
//
//  Created by Juan Catalan on 8/26/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var isAddNewContactPresented = false
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [
        SortDescriptor(\Contact.lastName, order: .forward),
        SortDescriptor(\Contact.firstName, order: .forward)
    ])
    private var contacts: [Contact]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts, id: \.self) { contact in
                    LabeledContent(contact.fullName) {
                        Text(contact.phoneNumber)
                            .monospacedDigit()
                            .foregroundStyle(.primary)
                    }
                }
                .onDelete(perform: deleteContact)
            }
            .navigationTitle("Contacts")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    isAddNewContactPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(.headline)
                }
            }
            .sheet(isPresented: $isAddNewContactPresented) {
                AddNewContactView()
            }
        }
    }
    
    private func deleteContact(at offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(contacts[index])
            }
        }
    }
}

struct AddNewContactView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Phone Number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                Spacer()
            }
            .padding(16)
            .navigationTitle("Add A New Contact")
            .toolbar {
                Button(action: saveContact) {
                    Image(systemName: "checkmark")
                        .font(.headline)
                }
                .disabled(isButtonDisabled)
            }
        }
    }
    
    private var isButtonDisabled: Bool {
        firstName.isEmpty || lastName.isEmpty || phoneNumber.isEmpty
    }
    
    private func saveContact() {
        let newContact = Contact(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber)
        modelContext.insert(newContact)
        dismiss()
    }
}

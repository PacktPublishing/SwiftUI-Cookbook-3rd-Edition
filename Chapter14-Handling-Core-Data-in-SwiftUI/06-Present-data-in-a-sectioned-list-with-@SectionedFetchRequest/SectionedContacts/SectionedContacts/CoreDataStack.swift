//
//  CoreDataStack.swift
//  CoreDataStack
//
//  Created by Giordano Scalzo on 02/09/2021.
//

import Foundation
import CoreData

class CoreDataStack: ObservableObject {
    private let persistentContainer: NSPersistentContainer
    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    init(modelName: String) {
        persistentContainer = {
            let container = NSPersistentContainer(name: modelName)
            container.loadPersistentStores { description, error in
                if let error = error {
                    print(error)
                }
            }
            return container
        }()
    }

    func save () {
        guard managedObjectContext.hasChanges else { return }
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
    }
}

extension CoreDataStack {
    func insertContact(firstName: String, lastName: String, phoneNumber: String) {
        let contact = Contact(context: managedObjectContext)
        contact.firstName = firstName
        contact.lastName = lastName
        contact.phoneNumber = phoneNumber
    }
}

extension CoreDataStack {
    func addContacts() {
        [("Daenerys", "Targaryen", "02079460803"),
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
         ("Sansa", "Stark", "02890180764")]
            .forEach { (firstName, lastName, phoneNumber) in
                insertContact(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber)
            }
        save()
    }
}

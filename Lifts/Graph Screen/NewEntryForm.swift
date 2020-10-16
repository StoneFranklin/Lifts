//
//  NewEntryForm.swift
//  Lifts
//
//  Created by Stone Franklin on 7/2/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

//Form for adding a new entry

import SwiftUI
import Combine

struct NewEntryForm: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var weight = ""
    
    var lift: Lift
    
    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
    
    //Creates the new entry object
    func addEntry(weight: String) {
           let newEntry = Entry(context: managedObjectContext)
           newEntry.weight = Double(weight)!
           newEntry.date = Date()
           newEntry.lift = lift
           saveContext()
       }
    
    var body: some View {
        NavigationView {
            Form {
                //Weight text field
                Section {
                    TextField("Weight", text: $weight)
                        .keyboardType(.numberPad)
                        .onReceive(Just(weight)) { newValue in
                            let filtered = newValue.filter { "0123456789.".contains($0) }
                            if filtered != newValue {
                                self.weight = filtered
                            }
                    }
                }
                //Create button
                Section {
                    Button (action: {
                        self.addEntry(weight: self.weight)
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Create Entry")
                    }.disabled(weight.isEmpty)
                }
            }
            .navigationBarTitle("New Entry")
            
        }
    }
}

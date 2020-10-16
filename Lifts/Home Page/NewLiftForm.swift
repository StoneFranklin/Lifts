//
//  NewLiftForm.swift
//  Lifts
//
//  Created by Stone Franklin on 6/22/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//
//This is the page the user is taken to if they click the plus button on the LiftList

import SwiftUI
import Combine

struct NewLiftForm: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var name: String = ""
    @State var weight: String = ""
       
    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
    
    func addLift(name: String, weight: String) {
        let newLift = Lift(context: managedObjectContext)
        newLift.name = name
        let newEntry = Entry(context: managedObjectContext)
        newEntry.weight = Double(weight)!
        newEntry.date = Date()
        newEntry.lift = newLift
        saveContext()
    }

    var body: some View {
        NavigationView {
            Form {
                //Lift name text field
                Section {
                    TextField("Lift Name", text: $name)
                }
                //Current max text field
                Section {
                    TextField("Current max", text: $weight)
                        .keyboardType(.numberPad)
                        .onReceive(Just(weight)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.weight = filtered
                            }
                    }
                }
                //Create button
                Section {
                    Button(
                        action: {
                            self.addLift(name: self.name, weight: self.weight)
                            self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Create Lift")
                    }.disabled(name.isEmpty || weight.isEmpty)
                }
            }
            .navigationBarTitle("New Lift")
        }
    }
}


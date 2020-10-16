//
//  LiftList.swift
//  Lifts
//
//  Created by Stone Franklin on 6/20/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//
//  Home Screen of the app. Shows the user the list of all lifts they've created, and allows them to create a new one.

import SwiftUI
import Combine

//The button view to be put into the LiftList
struct LiftListItem: View {
    var lift: Lift
    
    var body: some View {
        HStack {
            lift.name.map(Text.init)
            Spacer()
        }
        .padding()
    }
}

struct LiftList: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
        entity: Lift.entity(),
        sortDescriptors: []
    ) var lifts: FetchedResults<Lift>
    
    @State var newLiftFormShowing = false
    
    func saveContext() {
        do {
            try managedObjectContext.save()
            
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
    
    func deleteLift(at offsets: IndexSet) {
        offsets.forEach { index in
            let lift = self.lifts[index]
            self.managedObjectContext.delete(lift)
        }
        saveContext()
    }
    
    var body: some View {
        NavigationView {
            //List of all created lifts
            List {
                ForEach (lifts.reversed(), id: \.self) { lift in
                    NavigationLink(destination: GraphScreen(lift: lift)) {
                        LiftListItem(lift: lift)
                    }
                }
                .onDelete(perform: deleteLift(at:))
            }
                
            .navigationBarItems(
                leading:
                EditButton()
                    .padding([.top, .bottom, .trailing]),
                trailing:
                Button(action: {
                    self.newLiftFormShowing.toggle()
                }) {
                    Image(systemName: "plus")
                }
                .padding([.top, .leading, .bottom])
                .sheet(isPresented: $newLiftFormShowing) {
                    NewLiftForm().environment(\.managedObjectContext, self.managedObjectContext)
                }
            )
                .navigationBarTitle("Lifts")
            
            
        }
    }
}

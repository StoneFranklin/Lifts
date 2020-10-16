//
//  GraphScreen.swift
//  Lifts
//
//  Created by Stone Franklin on 6/13/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

//Parent screen for all graph elements

import SwiftUI
import Combine

struct GraphScreen: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var newEntryFormShowing = false
    
    var lift: Lift
    var gradient = Gradient(colors: [Color.yellow, Color.pink])
    var body: some View {
        VStack {
            //Graph itself
            LineGraph(entries: lift.entryArray)
                .padding([.leading, .trailing, .bottom])
                .aspectRatio(16/9, contentMode: .fit)
            
            Divider()
            
            //Displays current max and how much it has changed since first entry
            HStack{
                WeightCard(weight: lift.entryArray.last!.weight, startingWeight: false)
                
                ChangeCard(values: lift.entryArray)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color.black)
                    )
            }
            Divider()
            
            //New entry button
            Button(action: {
                self.newEntryFormShowing.toggle()
            }) {
                Text("New Entry")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(10.0)
                    .background(Color.blue)
                    .cornerRadius(16)
            }
            .offset(y: 12.5)
            .sheet(isPresented: self.$newEntryFormShowing) {
                NewEntryForm(lift: self.lift).environment(\.managedObjectContext, self.managedObjectContext)
            }
            
            //List of all previous entries
            EntryList(entries: lift.entryArray)
        }
        .navigationBarTitle(Text(String(lift.name!)), displayMode: .inline)
    }
}


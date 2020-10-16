//
//  EntryList.swift
//  Goals
//
//  Created by Stone Franklin on 7/16/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

//List of all previous entries

import SwiftUI

struct EntryListItem: View {

    //Views that go into the list
    
    var entry: Entry
    
    func convertDateToString(date: Date) -> String {
           let formatter1 = DateFormatter()
           formatter1.dateStyle = .short
           return formatter1.string(from: date)
       }
    
    var body: some View {
        HStack {
            Text(convertDateToString(date: entry.wrappedDate) + ":")
            Text(entry.wrappedWeight + " lbs")
            Spacer()
        }
    .padding()
    }
}

struct EntryList: View {
    var entries: [Entry]
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        List {
            Section(header: Text("Past Maxes")) {
            ForEach(entries.reversed(), id: \.self) { i in
                EntryListItem(entry: i)
            }
            }
        }
        .offset(y: 25)
    }
}


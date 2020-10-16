//
//  Test.swift
//  Goals
//
//  Created by Stone Franklin on 6/10/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

//All the elements of the graph put together

import SwiftUI

struct LineGraph: View {
    var entries: [Entry]
    var gradient = Gradient(colors: [Color.yellow, Color.pink])
    
    func createListofWeights (entries: [Entry]) -> [CGFloat] {
        var newValues: [CGFloat] = []
        for entry in entries {
            newValues.append(CGFloat(entry.weight))
        }
        return newValues
    }
    
    var body: some View {
        ZStack {
            if entries.count > 1 && createListofWeights(entries: entries).max() != createListofWeights(entries: entries).min(){
                HStack{
                    GraphLabel(values: createListofWeights(entries: entries))
                        .font(.system(size: 8))
                        .offset(x: -12, y: 8)
                    Spacer()
                }
                .padding([.top, .bottom], 5.0)
            }
            
            VStack {
                ZStack {
                    GraphBackground(values: createListofWeights(entries: entries))
                    GraphLine(entries: entries)
                }
                .padding([.top, .leading, .trailing])
            }
        }   
    }
}


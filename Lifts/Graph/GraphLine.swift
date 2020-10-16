//
//  GraphLine.swift
//  Goals
//
//  Created by Stone Franklin on 7/8/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

//Actual line based on the entries

import SwiftUI

struct LineShape: Shape {
    var entries: [Entry]
    
    func createListofWeights (entries: [Entry]) -> [CGFloat] {
        var newValues: [CGFloat] = []
        for entry in entries {
            newValues.append(CGFloat(entry.weight))
        }
        return newValues
    }
    
    func path(in rect: CGRect) -> Path {
        let values = createListofWeights(entries: entries)
        let minWeight = values.min()!
        let weightDiff = values.max()! - minWeight
        
        return Path { p in
            var x: CGFloat
            var y: CGFloat
            p.move(to: CGPoint(x: 0, y: (1 - ((CGFloat(values[0]) - minWeight) / weightDiff)) * rect.height))
            for i in 0..<values.count {
                x = CGFloat(i) / CGFloat(values.count - 1) * rect.width
                y = (1 - ((values[i] - minWeight) / weightDiff)) * rect.height
                p.addLine(to: CGPoint(x: x, y:  y))
            }
        }
    }
}

struct GraphLine: View {
    var entries: [Entry]
    var gradient = Gradient(colors: [Color.yellow, Color.pink])
    
    @State private var on = true
    
    var body: some View {
        LineShape(entries: entries)
            .trim(to: on ? 0 : 1)
            .stroke(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing), lineWidth: 2.5)
            .onAppear {
                return withAnimation(Animation.easeOut(duration: 2)) {
                    self.on.toggle()
                }
        }
    }
}

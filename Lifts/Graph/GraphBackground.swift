//
//  GraphBackground.swift
//  Goals
//
//  Created by Stone Franklin on 7/8/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

//Creates the horizontal lines on the graph

import SwiftUI

struct GraphBackgroundLines: Shape {
    var values: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        let step = (rect.height / 5)
        return Path { p in
            
            for i in 0...5 {
                p.move(to: CGPoint(x: rect.minX, y: step * CGFloat(i)))
                p.addLine(to: CGPoint(x: rect.maxX, y: step * CGFloat(i)))
            }
        }
    }
}

struct GraphBackground: View {
    var values: [CGFloat]
    var body: some View {
        ZStack{
        Rectangle()
            .stroke()
        GraphBackgroundLines(values: values)
            .stroke(Color.gray, lineWidth: 2)
            .opacity(0.5)
    }
    }
}


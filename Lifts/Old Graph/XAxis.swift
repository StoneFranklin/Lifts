//
//  XAxis.swift
//  Goals
//
//  Created by Stone Franklin on 6/13/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

import SwiftUI

struct XAxis: View {
    var body: some View {
       
        GeometryReader { g in
            Path { p in
                p.move(to: CGPoint(x: 0, y: 0))
                p.addLine(to: CGPoint(x: g.size.width, y: 0))
            }
            .stroke()
        }
        
    }
}

struct XAxis_Previews: PreviewProvider {
    static var previews: some View {
        XAxis()
            
    }
}

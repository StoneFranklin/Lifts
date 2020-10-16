//
//  YAxisTicks.swift
//  Goals
//
//  Created by Stone Franklin on 6/12/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

import SwiftUI

struct YTick: Shape {
    func path(in rect: CGRect) -> Path {
        

        return Path { p in
            
            }
        
    }
    
}
struct YAxisTicks: View {
    
    var label: Int
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack() {
                Path { p in
                    p.move(to: CGPoint(x: 0, y: 0))
                    p.addLine(to: CGPoint(x: geometry.size.width, y: 0))
                }

                .stroke(lineWidth: 1)
                //.frame(height: 1)

                Text(String(self.label))
                    .multilineTextAlignment(.leading)
                    .offset(x: (-(geometry.size.width / 2) + 15), y: (-(geometry.size.height / 2) - 10))
                    .font(.caption)

            }


        }
        //.frame(height: 1)
    }
}


struct YAxisTicks_Previews: PreviewProvider {
    static var previews: some View {
        YAxisTicks(label: 150)
            .frame(height: 100.0, alignment: .leading)
    }
}

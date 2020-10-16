//
//  YAxis.swift
//  Goals
//
//  Created by Stone Franklin on 6/12/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

import SwiftUI

struct YAxisLabel: View {
    
    var values: [CGFloat] = [200.0, 190.0, 195.0, 180.0, 160.0]
    
    func generateLabels() -> [Int] {
        let diff = values.max()! - values.min()!
        let num = diff / 10
        let high = values.max()!
        var labels: [Int] = [Int(high)]
        for i in 1...Int(num) {
            labels.append(Int(high - (CGFloat(i) * 10)))
        }
        return labels
    }
    var body: some View {
        GeometryReader { g in
            ZStack {
                Path { p in
                    p.move(to: CGPoint(x: 0, y: 0))
                    p.addLine(to: CGPoint(x: 0, y: g.size.height - (g.size.height / CGFloat(self.generateLabels().count))))
                }
                
                .stroke()
                
                
                VStack(spacing: 0) {
                    ForEach((self.generateLabels()), id: \.self) {
                        YAxisTicks(label: $0)
                    }
                }
                Path { p in
                    p.move(to: CGPoint(x: g.size.width, y: 0))
                    p.addLine(to: CGPoint(x: g.size.width, y: g.size.height - (g.size.height / CGFloat(self.generateLabels().count))))
                }
                .stroke()
            }
        
        }  
    }
}

struct YAxis_Previews: PreviewProvider {
    static var previews: some View {
        YAxisLabel()
            .frame(height: 500)
        .padding()
    }
}

//
//  XAxisLabel.swift
//  Goals
//
//  Created by Stone Franklin on 6/12/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

import SwiftUI

struct XAxisLabel: View {
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
        VStack {
            HStack() {
                ForEach((0...generateLabels().count - 1), id: \.self) {
                    XAxisTicks(label: (String(self.generateLabels()[$0])))
                }
                .frame(height: 30)
            
            }
            .overlay(XAxis())
        }
    }
}

struct XAxisLabel_Previews: PreviewProvider {
    static var previews: some View {
        XAxisLabel()
            .frame(height: 20)
    }
}

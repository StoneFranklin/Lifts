//
//  GraphLabel.swift
//  Goals
//
//  Created by Stone Franklin on 8/6/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

//Labels for the Y-axis

import SwiftUI

struct GraphLabel: View {
    var values: [CGFloat]
    
    func generateLabels() -> [String] {
        var newValues: [String] = []
        let diff = values.max()! - values.min()!
        let high = values.max()!
        let step = diff / 5
        for i in (0...5){
            newValues.append(String(format: "%.1f", Double(high) - (Double(i) * Double(step))))
        }
        return newValues
    }
    
    var body: some View {
        VStack {
            ForEach(0...4, id: \.self) { i in
                VStack{
                    Text(self.generateLabels()[i])
                    Spacer()
                }
                
            }
            Text(self.generateLabels()[5])
            
        }
    }
}

//struct GraphLabel_Previews: PreviewProvider {
//    static var previews: some View {
//        GraphLabel()
//    }
//}

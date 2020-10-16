//
//  ChangeCard.swift
//  Goals
//
//  Created by Stone Franklin on 7/23/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

//Used on graph screen to show the total difference in the lift.

import SwiftUI

struct ChangeCard: View {

    var values: [Entry]
    
    func generateDifference() -> Double {
        let last = values.last?.weight
        let first = values.first?.weight
        return Double((last! - first!))
    }
   
    var body: some View {
      
        //Displays a different arrow depending on if the progress was positive or not
        
        HStack {
            if generateDifference() == 0 {
                Image(systemName: "arrow.right")
                    .foregroundColor(Color.white)
                Text(String(format: "%.1f", (generateDifference())) + " lbs")
                    .foregroundColor(Color.white)
            }
            else if generateDifference() > 0 {
                Image(systemName: "arrow.up")
                    .foregroundColor(Color.green)
                Text(String(format: "%.1f", (generateDifference())) + " lbs")
                    .foregroundColor(Color.green)
            }
            else {
                Image(systemName: "arrow.down")
                    .foregroundColor(Color.red)
                Text(String(format: "%.1f", (generateDifference()) * -1) + " lbs")
                    .foregroundColor(Color.red)
            }
        }
        .padding()
    }
}

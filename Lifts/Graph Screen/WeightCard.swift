//
//  WeightCard.swift
//  Goals
//
//  Created by Stone Franklin on 8/4/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

//Used in the graph screen to display the current max

import SwiftUI

struct WeightCard: View {
    var weight: Double
    var startingWeight: Bool
    var body: some View {
        HStack{
            if startingWeight {
                Text("Start: " + String(weight) + " lbs")
            }
            else {
                Text("Current max: " + String(weight) + " lbs")
            }
        }
        .padding()
    }
}

struct WeightCard_Previews: PreviewProvider {
    static var previews: some View {
        WeightCard(weight: 100, startingWeight: false)
    }
}

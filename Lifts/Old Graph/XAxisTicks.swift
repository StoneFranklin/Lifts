//
//  XAxisTicks.swift
//  Goals
//
//  Created by Stone Franklin on 6/12/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

import SwiftUI

struct Tick: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { p in
            p.move(to: CGPoint(x: rect.midX, y: 0))
            p.addLine(to: CGPoint(x: rect.midX, y: 10))
        }
    }
}

struct XAxisTicks: View {
    var label: String
    var body: some View {
        GeometryReader { g in
            VStack(spacing: 0){
                Tick()
                    .stroke()
                Text(self.label)
                    .font(.footnote)
            }
            .scaledToFit()
        }
    }
}


struct XAxisTicks_Previews: PreviewProvider {
    static var previews: some View {
        XAxisTicks(label: "June '20")
            .frame(width: 100, height: 30)
                }
}

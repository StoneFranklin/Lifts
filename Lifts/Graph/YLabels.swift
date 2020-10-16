////
////  YLabels.swift
////  Goals
////
////  Created by Stone Franklin on 6/13/20.
////  Copyright © 2020 Stone Franklin. All rights reserved.
////
//
//import SwiftUI
//
////struct Labels: Shape {
////    var values: [CGFloat]
////
////    func path(in rect: CGRect) -> Path {
////
////        let step = (rect.height / 5)
////        return Path { p in
////
////
////        }
////
////
////
////    }
////}
////let min = values.min()!
////let maxDiff = values.max()! - min
//
//struct YLabels: View {
//
//    var topLabel: String
//    var bottomLabel: String
//    var body: some View {
//        HStack {
//
//            VStack(alignment: .leading) {
//                Text(topLabel)
//
//                Spacer()
//                Text(bottomLabel)
//                    .offset(CGSize(width: 0, height: 15))
//            }
//            .font(.footnote)
//            Spacer()
//        }
//    }
//}
//
//struct YLabels_Previews: PreviewProvider {
//    static var previews: some View {
//        YLabels(topLabel: "top", bottomLabel: "bottom")
//        .frame(width: 200, height: 200)
//    }
//}

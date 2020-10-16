//
//  test.swift
//  Goals
//
//  Created by Stone Franklin on 7/26/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//

import Foundation

//func filterEntries(entries: [Entry]) -> [Entry] {
//    var newEntries: [Entry] = []
//
//    let userCalendar = Calendar.current
//
//    var oneWeek = DateComponents()
//    oneWeek.weekOfYear = -1
//    var oneMonth = DateComponents()
//    oneMonth.month = -1
//    var oneYear = DateComponents()
//    oneYear.year = -1
//
//    let oneWeekAgo = userCalendar.date(byAdding: oneWeek, to: Date())!
//    let oneMonthAgo = userCalendar.date(byAdding: oneMonth, to: Date())!
//    let oneYearAgo = userCalendar.date(byAdding: oneYear, to: Date())!
//
//
//
//    for value in goal.entryArray {
//        switch timeShown {
//        case 0:
//            if value.wrappedDate > oneWeekAgo  {
//                newEntries.append(value)
//
//            }
//
//        case 1:
//            if value.wrappedDate > oneMonthAgo{
//                newEntries.append(value)
//
//            }
//
//        case 2:
//            if value.wrappedDate > oneYearAgo{
//               newEntries.append(value)
//
//            }
//
//        case 3:
//
//                newEntries.append(value)
//
//
//        default:
//            newEntries.append(value)
//
//        }
//    }
//    return newEntries
//}

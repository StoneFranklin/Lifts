//
//  Entry+CoreDataProperties.swift
//  Lifts
//
//  Created by Stone Franklin on 7/7/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//
//

import Foundation
import CoreData


extension Entry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        return NSFetchRequest<Entry>(entityName: "Entry")
    }

    @NSManaged public var date: Date?
    @NSManaged public var weight: Double
    @NSManaged public var lift: Lift?
    
    public var wrappedWeight: String {
        String(weight)
    }
    public var wrappedDate: Date {
        date!
    }
    
    

}

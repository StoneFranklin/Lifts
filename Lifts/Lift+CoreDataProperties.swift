//
//  Lift+CoreDataProperties.swift
//  Lifts
//
//  Created by Stone Franklin on 7/7/20.
//  Copyright © 2020 Stone Franklin. All rights reserved.
//
//

import Foundation
import CoreData


extension Lift {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lift> {
        return NSFetchRequest<Lift>(entityName: "Lift")
    }

    @NSManaged public var name: String?
    @NSManaged public var entry: NSSet?
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }
    
    public var entryArray: [Entry] {
        let set = entry as? Set<Entry> ?? []
        
        return set.sorted {
            $0.wrappedDate < $1.wrappedDate
        }
    }
}

// MARK: Generated accessors for entry
extension Lift {

    @objc(addEntryObject:)
    @NSManaged public func addToEntry(_ value: Entry)

    @objc(removeEntryObject:)
    @NSManaged public func removeFromEntry(_ value: Entry)

    @objc(addEntry:)
    @NSManaged public func addToEntry(_ values: NSSet)

    @objc(removeEntry:)
    @NSManaged public func removeFromEntry(_ values: NSSet)

}

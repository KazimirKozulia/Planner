//
//  Model.swift
//  Project
//
//  Created by Ghost on 25.05.23.
//


import Foundation
import CoreData

enum Section: Hashable {
    case main
}

@objc(Note)
public class Note: NSManagedObject {
    @NSManaged public var title: String
    @NSManaged public var body: String
    @NSManaged public var created: Date
}

extension Note {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        NSFetchRequest<Note>(entityName: "Note")
    }
}

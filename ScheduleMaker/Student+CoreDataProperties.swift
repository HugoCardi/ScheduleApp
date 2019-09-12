//
//  Student+CoreDataProperties.swift
//  ScheduleMaker
//
//  Created by Hugo Cruz on 9/5/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var last_names: String?
    @NSManaged public var student_name: String?
    @NSManaged public var lectures: NSSet?

}

// MARK: Generated accessors for lectures
extension Student {

    @objc(addLecturesObject:)
    @NSManaged public func addToLectures(_ value: Lecture)

    @objc(removeLecturesObject:)
    @NSManaged public func removeFromLectures(_ value: Lecture)

    @objc(addLectures:)
    @NSManaged public func addToLectures(_ values: NSSet)

    @objc(removeLectures:)
    @NSManaged public func removeFromLectures(_ values: NSSet)

}

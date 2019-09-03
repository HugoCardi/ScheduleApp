//
//  Student+CoreDataProperties.swift
//  ScheduleMaker
//
//  Created by Hugo Cruz on 8/29/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var enrolledLectures: NSObject?
    @NSManaged public var last_names: String?
    @NSManaged public var student_name: String?
}

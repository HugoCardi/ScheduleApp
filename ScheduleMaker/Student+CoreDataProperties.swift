//
//  Student+CoreDataProperties.swift
//  
//
//  Created by Hugo Cruz on 8/22/19.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var student_name: String?
    @NSManaged public var last_names: String?
    @NSManaged public var nickname: String?
    @NSManaged public var enrolledLectures: NSObject?

}

//
//  Lecture+CoreDataProperties.swift
//  
//
//  Created by Hugo Cruz on 8/27/19.
//
//

import Foundation
import CoreData


extension Lecture {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lecture> {
        return NSFetchRequest<Lecture>(entityName: "Lecture")
    }

    @NSManaged public var clave: Int32
    @NSManaged public var nombreAsignatura: Int32
    @NSManaged public var grupo: Int32
    @NSManaged public var profesor: String?
    @NSManaged public var tipo: String?
    @NSManaged public var hora_in: Float
    @NSManaged public var hora_fin: Float
    @NSManaged public var arrayDays: NSObject?
    @NSManaged public var salon: String?
    @NSManaged public var cupo: Int32
    @NSManaged public var vacantes: Int32

}

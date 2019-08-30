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
	
	
	func enrollLecture(lecture : Lecture, managedContext: NSManagedObjectContext) {
		let start = lecture.hora_in
		let end = lecture.hora_fin
		var x = 0
		var current = [NSManagedObject]()
		let fetchRequest =
			NSFetchRequest<NSManagedObject>(entityName: "Student")
		do {
			current = try managedContext.fetch(fetchRequest)
		} catch let error as NSError {
			print("Could not fetch. \(error), \(error.userInfo)")
		}
		print(current)
		/*
		for currentLecture in current{
			if (currentLecture.clave == lecture.clave){
				//Duplicated Lecture error handling
				print("\n\n The Lecture has already been enrolled in another group")
				return
			}else if ((currentLecture.hora_in ... currentLecture.hora_fin).contains(start) || (currentLecture.hora_in ... currentLecture.hora_fin).contains(end)) && currentLecture.arrayDays[x]{
				//Error, the times traslape with another current lecture time.
				print(" \n\nError -- Horarios traslapados.")
				return
			}else if (currentLecture.cupo == 0){
				//The group is already full
				print("\n\n Error -- No vacancy in the selected group ")
				
			}else{
				self.enrolledLectures.append(lecture)
				print("\n\n The student has been succesfully enrolled in the lecture:  \(lecture.nombreAsignatura). ")
			}
			x += 1
		}
*/
		}
	

}

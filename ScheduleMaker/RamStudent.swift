//
//  RamStudent.swift
//  ScheduleMaker
//
//  Created by Hugo Cruz on 9/3/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//
//
//  Student.swift
//  HTMLSearch
//
//  Created by Hugo Cruz on 8/8/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//
import Foundation
import CoreData
//Clase Student
class RamStudent{
	let student_name: String
	let last_names: String
	var nickname: String?
	var enrolledLectures: [RamLecture]
	init(student_name: String, last_names : String, nickname: String?, enrolledLectures : [RamLecture]) {
		self.student_name = student_name
		self.last_names = last_names
		if let nickname = nickname{
			self.nickname = nickname
		}
		self.enrolledLectures = enrolledLectures
	}
	
	func enrollLecture(lecture : RamLecture, studentSaved: Student, delegate : AppDelegate, context: NSManagedObjectContext) {
		let start = lecture.hora_in
		let end = lecture.hora_fin
		//var listOfSavedLectures = [NSManagedObject]()
		var currentLectures = [RamLecture]()
		var x = 0
		let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Lecture")
		
		do {
			let listOfSavedLectures = try context.fetch(fetchRequest)
			print(listOfSavedLectures)
		} catch let error as NSError {
			print("Could not fetch. \(error), \(error.userInfo)")
		}
		/*
		//self enrolled lectures must be a fetch from CoreData
		for currentLecture in currentLectures{
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
				//self.enrolledLectures.append() must be replaced by CoreData save function
				self.enrolledLectures.append(lecture)
				print("\n\n The student has been succesfully enrolled in the lecture:  \(lecture.nombreAsignatura). ")
			}
			x += 1
		*/
		}
	}
	
	


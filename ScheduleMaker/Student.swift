//
//  Student.swift
//  ScheduleMaker
//
//  Created by Hugo Cruz on 8/22/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import Foundation
import CoreData
//Clase Student
class Student{
	let student_name: String
	let last_names: String
	var nickname: String?
	var enrolledLectures: [Lecture]
	init(student_name: String, last_names : String, nickname: String?, enrolled_lectures : [Lecture]) {
		self.student_name = student_name
		self.last_names = last_names
		if let nickname = nickname{
			self.nickname = nickname
		}
		self.enrolledLectures = enrolled_lectures
	}
	
	func enrollLecture(lecture : Lecture) {
		let start = lecture.hora_in
		let end = lecture.hora_fin
		var x = 0
		for currentLecture in self.enrolledLectures{
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
	}
	
	
}

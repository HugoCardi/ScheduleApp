//
//  Student.swift
//  HTMLSearch
//
//  Created by Servicio Hugo on 8/12/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import Foundation
//Clase Student
class Student{
	let st_name : String
	let last_names : String
	var nickname : String?
	var enrolled_lectures : [Lecture]
	init(st_name : String, last_names : String, nickname: String?, enrolled_lectures : [Lecture]) {
		self.st_name = st_name
		self.last_names = last_names
		if let nickname = nickname{
			self.nickname = nickname
		}
		self.enrolled_lectures = enrolled_lectures
	}
}

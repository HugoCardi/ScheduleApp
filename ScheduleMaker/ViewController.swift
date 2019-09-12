//
//  ViewController.swift
//  ScheduleMaker
//
//  Created by Hugo Cruz on 8/22/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
	let appDelegate = UIApplication.shared.delegate as! AppDelegate
	let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
	var savedEnrolled = [Lecture]()
	var defaultUser = [Student]()
	var ramEnrolled = [RamLecture]()
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

	override func viewWillAppear(_ animated: Bool) {
		
		loadFromCoreData()
		//extractFromHTML(claveDeseada: "2930")
	}
	func loadFromCoreData() {
		var fetchedUser: RamStudent
		//Code to fetch and save all the current enrolled lectures into saveEnrolled[Lecture]
		do {
			savedEnrolled = try managedContext.fetch(Lecture.fetchRequest())
			for lecture in savedEnrolled {
				ramEnrolled.append(RamLecture(clave: Int(lecture.clave), nombreAsignatura: lecture.nombreAsignatura!, grupo: Int(lecture.grupo), profesor: lecture.profesor!, tipo: lecture.tipo!, hora_in: lecture.hora_in,hora_fin: lecture.hora_fin, dias: lecture.arrayDays!, salon: lecture.salon!, cupo: Int(lecture.cupo), vacantes: Int(lecture.vacantes)))
			}

			defaultUser = try managedContext.fetch(Student.fetchRequest())
			let aux = defaultUser.first
			fetchedUser = RamStudent(student_name: aux!.student_name!, last_names: aux!.last_names!, nickname: nil, enrolledLectures: ramEnrolled)
			print(fetchedUser.student_name)
			
		}catch let error as NSError {
			print("Could not fetch : \(error)")
		}

		
	}

}


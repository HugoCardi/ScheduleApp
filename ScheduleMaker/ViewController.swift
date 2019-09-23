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
	//var currentlyEnrolled = [RamLecture]()
	var defaultUser: Student? = nil
	
	override func viewDidLoad() {
		//self.currentlyEnrolled = loadFromCoreData()
		self.defaultUser = getStudentFromCoreData()
		super.viewDidLoad()
		//print("User Name")
		print(defaultUser?.student_name! ?? "Unable to print users name")

		//7 Do any additional setup after loading the view.
	}

	override func viewWillAppear(_ animated: Bool) {
		//Extract from HTML returns an array of RAMLectures
		let enrolledInCoreData = defaultUser?.lectures as! Set<Lecture>
		for enrolled in enrolledInCoreData{
			print("Nombre estudiante : \(String(describing: enrolled.student?.student_name))")
			print("Nombre asignatura del estudiante : \(enrolled.nombreAsignatura)")
		}
	}
	override func viewDidAppear(_ animated: Bool) {

		
		
	}
	func getStudentFromCoreData() -> Student?{
		do {
			let coreDataUsers = try managedContext.fetch(Student.fetchRequest())
			return coreDataUsers.first as? Student
		}catch let error as NSError{
			print("Could not fetch : \(error)")
		}
		return nil
	}
	func enrollLecture(currentlyInCoreData: Set<Lecture>, lectureToEnroll: Lecture){
		let starts = lectureToEnroll.hora_in
		let ends = lectureToEnroll.hora_fin

		for enrolledLecture in currentlyInCoreData{
			for iterator in Range(0 ... currentlyInCoreData.count){
				if enrolledLecture.arrayDays[iterator] == lectureToEnroll.arrayDays[iterator]{
					if  ((enrolledLecture.hora_in ... enrolledLecture.hora_fin).contains(starts) || (enrolledLecture.hora_in ... enrolledLecture.hora_fin).contains(ends)){
						print("Error, time of new lecture is already busy.")
						return
			}
			if(enrolledLecture.clave == lectureToEnroll.clave){
				print("\n\n The Lecture has already been enrolled in another group")
				return
			}else if (lectureToEnroll.cupo == 0){
				print("Error, No vacancy in the selected group")
				return
			}else{
				print("Se ha agregado correctamente : \(lectureToEnroll.nombreAsignatura) en el grupo : \(lectureToEnroll.grupo)")
				//to declare function to save lecture
			}
			}
			}
		}
	}
	
	func loadFromCoreData() -> [RamLecture]{
		var savedEnrolled = [Lecture]()
		var ramEnrolled = [RamLecture]()
		//Code to fetch and save all the current enrolled lectures into saveEnrolled[Lecture]
		do {
			savedEnrolled = try managedContext.fetch(Lecture.fetchRequest())
			for lecture in savedEnrolled {
				if (lecture.student?.student_name) == defaultUser?.student_name {
					ramEnrolled.append(RamLecture(clave: Int(lecture.clave), nombreAsignatura: lecture.nombreAsignatura, grupo: Int(lecture.grupo), profesor: lecture.profesor, tipo: lecture.tipo, hora_in: lecture.hora_in,hora_fin: lecture.hora_fin, dias: lecture.arrayDays, salon: lecture.salon, cupo: Int(lecture.cupo), vacantes: Int(lecture.vacantes)))
				}
			}
		}catch let error as NSError {
			print("Could not fetch : \(error)")
			//returns an empty array
			return [RamLecture]()
		}
		return ramEnrolled
		
	}
}

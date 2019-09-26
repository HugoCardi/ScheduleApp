//
//  ViewController.swift
//  ScheduleMaker
//
//  Created by Hugo Cruz on 8/22/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//comprobante inscripcion, dos fotos infantiles, pago $40

//Modify logic in enrollLecture to check availability within the foor-loop
//Place returns false in the for-loop so that the flows fails to enroll in any case it's impossible to enroll
//if the function doesn't return, then self.addToLectures

import UIKit
import CoreData

class ViewController: UIViewController {
	let appDelegate = UIApplication.shared.delegate as! AppDelegate
	let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
	var defaultUser: Student? = nil
	
	override func viewDidLoad() {
		self.defaultUser = getStudentFromCoreData()
		super.viewDidLoad()
		//7 Do any additional setup after loading the view.
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

	override func viewWillAppear(_ animated: Bool) {
		//Code to test the functionality of core data
		/*
		var enrolledInCoreData = defaultUser?.lectures as! Set<Lecture>
		for enrolled in enrolledInCoreData{
			print("Nombre asignatura n del estudiante : \(enrolled.nombreAsignatura)")
		}
		let instanceToDelete = fetchInstanceToDeleteFunction(clave: 0674)
		if let instanceToDelete = instanceToDelete {
			self.deleteLectureFromCoreData(lectureToRemove: instanceToDelete)
		}else{
			print("Error, no lecture with that key has been enrolled")
		}
        print("I'm a breakline")
		enrolledInCoreData = defaultUser?.lectures as! Set<Lecture>
        for enrolled in enrolledInCoreData{
            //print("Nombre estudiante : \(String(describing: enrolled.student?.student_name))")
            print("Nombre asignatura n del estudiante : \(enrolled.nombreAsignatura)")
        }
		*/

	}

    func  testFunction() {
        let lecture = NSEntityDescription.insertNewObject(forEntityName: "Lecture", into: managedContext) as! Lecture
        lecture.nombreAsignatura = "Computo Movil"
        lecture.clave = 0674
        lecture.arrayDays = [true, false, false, false, false, true]
        lecture.cupo = 30
        lecture.grupo = 2
        lecture.hora_in = 17.0
        lecture.hora_fin = 19.0
        lecture.profesor = "Rocio Aldeco"
        lecture.tipo = "T"
        lecture.salon = "B403"
        lecture.vacantes = 0
        self.enrollLecture(lectureToEnroll: lecture)
    }
	override func viewDidAppear(_ animated: Bool) {

		
		
	}
    

	func enrollLecture(lectureToEnroll: Lecture){
        let currentlyInCoreData = self.defaultUser?.lectures as! Set<Lecture>
		let starts = lectureToEnroll.hora_in
		let ends = lectureToEnroll.hora_fin
		for enrolledLecture in currentlyInCoreData{
			for iterator in Range(0 ... 5){
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
			}
			}
			}
		}
		defaultUser?.addToLectures(lectureToEnroll)
		print("Se ha agregado correctamente : \(lectureToEnroll.nombreAsignatura) en el grupo \(lectureToEnroll.grupo)")
		appDelegate.saveContext()
		return
		//to declare function to save lecture
	}
	func fetchInstanceToDeleteFunction(clave: Int) -> Lecture?{
		for item in self.defaultUser?.lectures as! Set<Lecture>{
			if item.clave == clave{
				return item
			}
		}
		return nil
	}
    func deleteLectureFromCoreData(lectureToRemove: Lecture){
        defaultUser?.removeFromLectures(lectureToRemove)
        let temp =  defaultUser?.lectures as! Set<Lecture>
        for names in temp{
            if names.nombreAsignatura == lectureToRemove.nombreAsignatura{
                print("Error while deleting the Lecture")
                return
            }
        }
        print("\(lectureToRemove.nombreAsignatura) has been removed correctly")
		return
    }
	
}

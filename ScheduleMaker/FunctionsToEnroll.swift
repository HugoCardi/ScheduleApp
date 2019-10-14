//
//  EnrollFunctions.swift
//  ScheduleMaker
//
//  Created by Hugo Cruz on 10/10/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import Foundation
import CoreData


func stringClaveLecture(clave :String){
	let possibleToEnroll = extractFromHTML(claveDeseada: clave)
	if let possibleToEnroll = possibleToEnroll{
		for _ in possibleToEnroll {
			//print("\(possible.clave) || \(possible.grupo) || \(possible.profesor) || \(possible.horario!) || ")
		}
		//self.enrollLecture(lectureToEnroll: RamLectureToLecture(possibleToEnroll.randomElement()!))
	}else{
		print("Oh Oh. something has gone terribly wrong")
	}

}

func RamLectureToLecture (_ value : RamLecture ,appDelegate : AppDelegate) -> Lecture{
	print("attempting to enroll in group \(value.grupo)")
	let managedContext = appDelegate.persistentContainer.viewContext
	let preparedLectureForCoreData = NSEntityDescription.insertNewObject(forEntityName: "Lecture", into: managedContext) as! Lecture
	preparedLectureForCoreData.clave = Int32(value.clave)
	preparedLectureForCoreData.grupo = Int32(value.grupo)
	preparedLectureForCoreData.nombreAsignatura = value.nombreAsignatura
	preparedLectureForCoreData.profesor = value.profesor
	preparedLectureForCoreData.hora_in = value.hora_in
	preparedLectureForCoreData.hora_fin = value.hora_fin
	preparedLectureForCoreData.vacantes = Int32(value.vacantes)
	preparedLectureForCoreData.cupo = 1
	preparedLectureForCoreData.arrayDays = value.arrayDays
	preparedLectureForCoreData.salon = value.salon
	preparedLectureForCoreData.tipo = value.tipo
	return preparedLectureForCoreData
}

func enrollLecture(lectureToEnroll: Lecture, possibleUserInUse: Student?, appDelegate:AppDelegate) -> Bool{
	let starts = lectureToEnroll.hora_in
	let ends = lectureToEnroll.hora_fin
	guard let userInUse =  possibleUserInUse else{
		return false
	}
	if let currentlyInCoreData = userInUse.lectures as! Set<Lecture>?{
	for enrolledLecture in currentlyInCoreData{
		for iterator in Range(0 ... 5){
			if enrolledLecture.arrayDays[iterator] == lectureToEnroll.arrayDays[iterator]{
				if  ((enrolledLecture.hora_in ... enrolledLecture.hora_fin).contains(starts) || (enrolledLecture.hora_in ... enrolledLecture.hora_fin).contains(ends)){
					print("Error, time of new lecture is already busy.")
					return false
				}
				if(enrolledLecture.clave == lectureToEnroll.clave){
					print("\n\n The Lecture has already been enrolled in another group")
					return false
				}else if (lectureToEnroll.cupo == 0){
					print("Error, No vacancy in the selected group")
					return false
				}
			}
		}
	}
	}
	userInUse.addToLectures(lectureToEnroll)
	print("Se ha agregado correctamente : \(lectureToEnroll.nombreAsignatura) en el grupo \(lectureToEnroll.grupo)")
	appDelegate.saveContext()
	return true
	//to declare function to save lecture
}


func getStudentFromCoreData(appDelegate : AppDelegate) -> Student?{
	let managedContext = appDelegate.persistentContainer.viewContext
	do {
		let coreDataUsers = try managedContext.fetch(Student.fetchRequest())
		return coreDataUsers.first as? Student
	}catch let error as NSError{
		print("Could not fetch : \(error)")
	}
	return nil
}

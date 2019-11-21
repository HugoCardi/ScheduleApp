//
//  EnrollFunctions.swift
//  ScheduleMaker
//
//  Created by Hugo Cruz on 10/10/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import SwiftSoup

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
	guard let userInUse = possibleUserInUse else{
		return false
	}
	if let currentlyInCoreData = userInUse.lectures as! Set<Lecture>?{
	for enrolledLecture in currentlyInCoreData{
		for iterator in Range(0 ... 5){
			if ((enrolledLecture.arrayDays[iterator] == lectureToEnroll.arrayDays[iterator]) && (enrolledLecture.arrayDays[iterator] == true)) {
				if  ((enrolledLecture.hora_in - 0.01 ... enrolledLecture.hora_fin - 0.01).contains(starts) || (enrolledLecture.hora_in - 0.01 ... enrolledLecture.hora_fin - 0.01 ).contains(ends)){
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

func fetchInstanceToDeleteFunction(clave: Int, possibleUser: Student?, appDelegate: AppDelegate) -> Lecture?{
	guard let user = possibleUser else {return nil}
	for item in user.lectures as! Set<Lecture>{
		if item.clave == clave{
			return item
		}
	}
	return nil
}
func deleteLectureFromCoreData(lectureToRemove: Lecture, possibleUser: Student?, appDelegate :AppDelegate) -> Bool{
	guard let user = possibleUser else {return false}
	
	user.removeFromLectures(lectureToRemove)
	let temp =  user.lectures as! Set<Lecture>
	for names in temp{
		if names.nombreAsignatura == lectureToRemove.nombreAsignatura{
			print("Error while deleting the Lecture")
			return false
		}
	}
	print("\(lectureToRemove.nombreAsignatura) has been removed correctly")
	return true
}

func daysToArray(_ arrayDays: [Bool]) -> String{
    var horarioFinal: String = ""
    
    if arrayDays[0] == true {
        horarioFinal += "LUN-"
    }
    if arrayDays[1] == true {
        horarioFinal += "MAR-"
    }
    if arrayDays[2] == true {
        horarioFinal += "MIE-"
    }
    if arrayDays[3] == true {
        horarioFinal += "JUE-"
    }
    if arrayDays[4] == true {
        horarioFinal += "VIE-"
    }
    if arrayDays[5] == true {
        horarioFinal += "SAB-"
    }
    
    horarioFinal = String(horarioFinal.dropLast())
    return horarioFinal
}

//
//  DataManager.swift
//  HTMLSearch
//
//  Created by Hugo Cruz on 8/14/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import Foundation
import SwiftSoup
import CoreData
var test = [NSManagedObject]()

func ExtractLectures(data: [Element]) {
	for group in data{
		do{
			if (group.children().count == 9){
				let clave = try Int(group.child(0).text()) ?? 0
				let grup = try Int(group.child(1).text()) ?? 0
				let nombre = asignatura[String(clave)] ?? "Not available"
				let profesor = try group.child(2).text()
				let tipo = try group.child(3).text()
				let horario = try group.child(4).text()
				let dias = try group.child(5).text()
				let salon = try group.child(6).text()
				let cupo = try Int(group.child(7).text()) ?? 0
				let vacantes = try Int(group.child(8).text()) ?? 0
				if (clave != 0){
					let a = Lecture(clave: clave, nombreAsignatura: nombre, grupo: grup, profesor: profesor, tipo: tipo, horario: horario, dias: dias, salon: salon, cupo: cupo, vacantes: vacantes)
					//test.append(a)
				}
			}
			print("\n\n\n")
			
		} catch{
			print("Holi")
		}
	}
	
}

func save(lecture: Lecture) {
	
	guard let appDelegate =
		UIApplication.shared.delegate as? AppDelegate else {
			return
	}
	// 1
	let managedContext = appDelegate.persistentContainer.viewContext
	// 2
	let entity = NSEntityDescription.entity(forEntityName: "Lecture", in: managedContext)!
	let lectureObject = NSManagedObject(entity: entity, insertInto: managedContext)
	// 3
	lectureObject.setValue(lecture.clave, forKey: "clave")
	lectureObject.setValue(lecture.cupo, forKey: "cupo")
	lectureObject.setValue(lecture.grupo, forKey: "grupo")
	lectureObject.setValue(lecture.cupo, forKey: "cupo")
	lectureObject.setValue(lecture.profesor, forKey: "profesor")
	lectureObject.setValue(lecture.hora_in, forKey: "hora_in")
	lectureObject.setValue(lecture.vacantes, forKey: "vacantes")
	lectureObject.setValue(lecture.nombreAsignatura, forKey: "nombreAsignatura")
	lectureObject.setValue(lecture.hora_fin, forKey: "hora_fin")
	lectureObject.setValue(lecture.salon, forKey: "salon")
	lectureObject.setValue(lecture.tipo, forKey: "tipo")
	lectureObject.setValue(lecture.hora_fin, forKey: "hora_fin")

	// 4
	do {
		try managedContext.save()
		test.append(lectureObject)
	} catch let error as NSError {
		print("Could not save. \(error), \(error.userInfo)")
	}
}



//End of Function

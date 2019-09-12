//
//  DataManager.swift
//  ScheduleMaker
//
//  Created by Hugo Cruz on 8/27/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//
import Foundation
import SwiftSoup
import CoreData



func createLectures(data: [Element])  -> [RamLecture] {
	var possibleChoices =  [RamLecture]()
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
					//possibleChoices.append(Lecture(clave: clave, nombreAsignatura: nombre, grupo: grup, profesor: profesor, tipo: tipo, horario: horario, dias: dias, salon: salon, cupo: cupo, vacantes: vacantes))
					//test.append(a)
					print(clave,grup,nombre,profesor,tipo,horario,dias,salon, cupo, vacantes)
					//Atempting to init a new class.
					//Translation of Run-Time Lecture to CoreDataLecture still to be written
					possibleChoices.append(RamLecture(clave: clave, nombreAsignatura: nombre, grupo: grup, profesor: profesor, tipo: tipo, horario: horario, dias: dias, salon: salon, cupo: cupo, vacantes: vacantes))
				}
			}
			//Line jump to improve style of the test output : To be removed before deploy
			print("\n")
			
		} catch{
			print("Error while obtaining data from the parsed HTML")
		}
	}
	return possibleChoices
}

func extractFromHTML(claveDeseada : String) -> [RamLecture]?{
	var choices: [RamLecture]?
	if asignatura[claveDeseada] != nil{
		let stringedURL = "https://ssa.ingenieria.unam.mx/cj/tmp/programacion_horarios/" + claveDeseada + ".html"
		if let url = URL(string: stringedURL) {
			do {
				let html = try String(contentsOf: url)
				let doc: Document = try SwiftSoup.parse(html)
				var link: [Element] = try doc.select("tr").array()
				//Remove HTML Headers
				link.remove(at: 0)
				//Remove Table titles
				link.remove(at: 0)
				choices = createLectures(data: link)
			} catch {
				print("Content could not be loaded")
				//Return will be null
				return choices
			}
		} else {
			print("The URL is invalid")
		}
	}else{
		/* DEPRECATED
		let alert = UIAlertController(title: "Error de clave", message: "La clave no existe o no hay grupos disponibles para dicha asignatura", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		self.present(alert, animated: true)
		*/
		print("\n\nNo existen grupos para dicha asignatura")
		//Return will be null
		return choices
	}//Extraction Function Closing Bracket
	return choices
}

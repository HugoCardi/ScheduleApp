//
//  DataManager.swift
//  ScheduleMaker
//
//  Created by Hugo Cruz on 8/22/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import Foundation
import SwiftSoup
import CoreData
//var test = [NSManagedObject]()



func extractLectures(data: [Element])  -> [Lecture] {
	var possibleChoices =  [Lecture]()
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
					print("Alright")
					print(clave,grup,nombre,profesor,tipo,horario,dias,salon, cupo, vacantes)
				}
			}
			print("\n\n\n")
			
		} catch{
			print("Holi")
		}
	}
	return possibleChoices
}

func extractFromHTML(claveDeseada : String){
	if asignatura[claveDeseada] != nil{
		let stringedURL = "https://ssa.ingenieria.unam.mx/hrsHtml/" + claveDeseada + ".html"
		if let url = URL(string: stringedURL) {
			do {
				let html = try String(contentsOf: url)
				let doc: Document = try SwiftSoup.parse(html)
				var link: [Element] = try doc.select("tr").array()
				link.remove(at: 0)
				link.remove(at: 0)
				_ = extractLectures(data: link)
			} catch {
				print("Content could not be loaded")
			}
		} else {
			print("The URL is invalid")
		}
	}else{/*
		let alert = UIAlertController(title: "Error de clave", message: "La clave no existe o no hay grupos disponibles para dicha asignatura", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		self.present(alert, animated: true)
		*/
		print("\n\nNo existen grupos para dicha asignatura")
	}//Extraction Function Closing Bracket
}

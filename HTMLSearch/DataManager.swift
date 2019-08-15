//
//  DataManager.swift
//  HTMLSearch
//
//  Created by Hugo Cruz on 8/14/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import Foundation
import SwiftSoup
var test = [Lecture]()

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
					test.append(a)
				}
			}
			print("\n\n\n")
			
		} catch{
			print("Holi")
		}
	}
	
}

//End of Function

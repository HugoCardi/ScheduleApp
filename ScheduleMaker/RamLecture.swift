//
//  RamLecture.swift
//  ScheduleMaker
//
//  Created by Hugo Cruz on 9/3/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import Foundation
import CoreData

class RamLecture {
	
	var clave: Int
	var nombreAsignatura : String
	var grupo: Int
	var profesor: String
	var tipo : String
	var hora_in: Float = 0.0
	var hora_fin: Float = 0.0
	var horario: String?
	//var dias: String
	var arrayDays: [Bool]
	var salon: String
	var cupo: Int
	var vacantes: Int
	//Init to manage all incoming lectures from HTML Scrapping, this means producing times of begining and ending, creating the array of days and so.
	init(clave: Int, nombreAsignatura :String,  grupo: Int, profesor: String, tipo: String, horario: String, dias: String, salon: String, cupo: Int, vacantes: Int  ) {
		self.clave = clave
		self.nombreAsignatura = nombreAsignatura
		self.grupo = grupo
		self.profesor = profesor
		self.tipo = tipo
		self.horario = horario
		self.arrayDays = [false,false,false,false,false,false,false]
		//self.dias = dias
		self.salon = salon
		self.cupo = cupo
		self.vacantes = vacantes
		timeToFloat()
		daysToArray(dias: dias)
	}
	//Init to fetch from already managed Lectures, this is, Lectures that have already had their times and days  converted from strings that were obtained from the HTML Scrapper.
	init(clave: Int, nombreAsignatura :String,  grupo: Int, profesor: String, tipo: String, hora_in: Float, hora_fin: Float, dias: [Bool], salon: String, cupo: Int, vacantes: Int  ) {
		self.clave = clave
		self.nombreAsignatura = nombreAsignatura
		self.grupo = grupo
		self.profesor = profesor
		self.tipo = tipo
		self.hora_in = hora_in
		self.hora_fin = hora_fin
		self.arrayDays = dias
		//self.dias = dias
		self.salon = salon
		self.cupo = cupo
		self.vacantes = vacantes
		self.horario = nil
	}
	func timeToFloat(){
		//Separation of format : "x:xxhrs a y:yyhrs" into ["x:xxhrs", y:yyhrs"]
		let array_of_times = self.horario!.split(separator: "a")
		let begin = array_of_times[0].replacingOccurrences(of: ":", with: ".")
		let end = array_of_times[1].replacingOccurrences(of: ":", with: ".")
		self.hora_in = Float(begin.replacingOccurrences(of: " ", with: "")) ?? 0.0
		self.hora_fin = Float(end.replacingOccurrences(of: " ", with: "")) ?? 0.0
		//print(temp)
	}
	func daysToArray(dias : String) {
		let arrayOfString = dias.split(separator: ",")
		for day in arrayOfString{
			let a = day.replacingOccurrences(of: " ", with: "")
			switch a {
			case "Lun":
				self.arrayDays[0] = true
				break
			case "Mar":
				self.arrayDays[1] = true
				break
			case "Mie":
				self.arrayDays[2] = true
				break
			case "Jue":
				self.arrayDays[3] = true
				break
			case "Vie":
				self.arrayDays[4] = true
				break
			case "Sab":
				self.arrayDays[5] = true
				break
			default:
				print("Wanker for coming on Sunday")
				break
			}
		}
	}
}

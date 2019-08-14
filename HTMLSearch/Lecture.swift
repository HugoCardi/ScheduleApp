//
//  Lecture.swift
//  HTMLSearch
//
//  Created by Hugo Cruz on 8/8/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import Foundation

class Lecture  {
	var clave: Int
	var nombreAsignatura : String
	var grupo: Int
	var profesor: String
    var tipo : String
	var hora_in: Float = 0.0
	var hora_fin: Float = 0.0
	var horario: String
	var dias: String
	var salon: String
	var cupo: Int
	var vacantes: Int
	
	init(clave: Int, nombreAsignatura :String,  grupo: Int, profesor: String, tipo: String, horario: String, dias: String, salon: String, cupo: Int, vacantes: Int  ) {
		self.clave = clave
		self.nombreAsignatura = nombreAsignatura
		self.grupo = grupo
		self.profesor = profesor
        self.tipo = tipo
		self.horario = horario
		self.dias = dias
		self.salon = salon
		self.cupo = cupo
		self.vacantes = vacantes
		time_to_float()
	}
	func time_to_float(){
		//Separation of format : "x:xxhrs a y:yyhrs" into ["x:xxhrs", y:yyhrs"]
		var array_of_times = self.horario.split(separator: "a")
		let begin = array_of_times[0].replacingOccurrences(of: ":", with: ".")
		let end = array_of_times[1].replacingOccurrences(of: ":", with: ".")
		self.hora_in = Float(begin.replacingOccurrences(of: " ", with: "")) ?? 0.0
		self.hora_fin = Float(end.replacingOccurrences(of: " ", with: "")) ?? 0.0
		//print(temp)
	}
}

//
//  Lecture.swift
//  HTMLSearch
//
//  Created by Hugo Cruz on 8/8/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import Foundation

class Lectures  {
	var clave: Int
	var grupo: Int
	var profesor: String
	var hora_in: Float = 0.0
	var hora_fin: Float = 0.0
	var horario: String
	var dias: String
	var salon: String
	var cupo: Int
	var vacantes: Int
	
	init(clave: Int, grupo: Int, profesor: String, tipo: String, horario: String, dias: String, salon: String, cupo: Int, vacantes: Int  ) {
		self.clave = clave
		self.grupo = grupo
		self.profesor = profesor
		self.horario = horario
		self.dias = dias
		self.salon = salon
		self.cupo = cupo
		self.vacantes = vacantes
	}
}

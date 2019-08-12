//
//  ViewController.swift
//  HTMLSearch
//
//  Created by Hugo Cruz on 8/6/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController {
    var test = [Lecture]()
	override func viewDidLoad() {
		super.viewDidLoad()
		Extraccion()
		// Do any additional setup after loading the view.
	}
	
	func Limpieza(data : [Element]){
		for group in data{
			do{
                if (group.children().count == 9){
                    let clave = try Int(group.child(0).text())!
                    let grup = try Int(group.child(1).text())!
                    let profesor = try group.child(2).text()
                    let tipo = try group.child(3).text()
                    let horario = try group.child(4).text()
                    let dias = try group.child(5).text()
                    let salon = try group.child(6).text()
                    let cupo = try Int(group.child(7).text())!
                    let vacantes = try Int(group.child(8).text())!
                    let a = Lecture(clave: clave, grupo: grup, profesor: profesor, tipo: tipo, horario: horario, dias: dias, salon: salon, cupo: cupo, vacantes: vacantes)
                    test.append(a)
                    
                }
                    print("\n\n\n")

			} catch{
				print("Holi")
		}
	}
	}
	
	
	func Extraccion(){
		if let url = URL(string: "https://ssa.ingenieria.unam.mx/hrsHtml/1322.html") {
			do {
				let html = try String(contentsOf: url)
				let doc: Document = try SwiftSoup.parse(html)
                var link: [Element] = try doc.select("tr").array()
                link.remove(at: 0)
				Limpieza(data: link)
                print(test)
				//print(link)
			} catch {
				print("Content could not be loaded")
			}
		} else {
				print("The URL is invalid")
				}
		}
	}

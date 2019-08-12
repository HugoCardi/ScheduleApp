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

	override func viewDidLoad() {
		super.viewDidLoad()
		Extraccion()
		// Do any additional setup after loading the view.
	}
	
	func Limpieza(data : [Element]){
		for group in data{
			do{
				var temp = try group.children().text()
				if !(temp == "GRUPOS SIN VACANTES") && !(temp == "GRUPOS CON VACANTES"){
					print(temp)
				}
			} catch{
				print("Holi")
		}
	}
	}
	
	
	func Extraccion(){
		if let url = URL(string: "https://ssa.ingenieria.unam.mx/hrsHtml/674.html") {
			do {
				let html = try String(contentsOf: url)
				let doc: Document = try SwiftSoup.parse(html)
				var link: [Element] = try doc.select("tr").array()
				Limpieza(data: link)
				//print(link)
			} catch {
				print("Content could not be loaded")
			}
		} else {
				print("The URL is invalid")
				}
		}
	}

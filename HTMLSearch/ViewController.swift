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
		// Do any additional setup after loading the view.
	}
	override func viewDidAppear(_ animated: Bool) {
		Extraccion(claveDeseada: "674")
	}

	func Extraccion(claveDeseada : String){
		if asignatura[claveDeseada] != nil{
			let stringedURL = "https://ssa.ingenieria.unam.mx/hrsHtml/" + claveDeseada + ".html"
			if let url = URL(string: stringedURL) {
				do {
					let html = try String(contentsOf: url)
					let doc: Document = try SwiftSoup.parse(html)
					var link: [Element] = try doc.select("tr").array()
					link.remove(at: 0)
					link.remove(at: 0)
					ExtractLectures(data: link)
				} catch {
					print("Content could not be loaded")
				}
			} else {
				print("The URL is invalid")
			}
		}else{
			let alert = UIAlertController(title: "Error de clave", message: "La clave no existe o no hay grupos disponibles para dicha asignatura", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
			self.present(alert, animated: true)
		}
		for instanceOfLecture in test{
			print(instanceOfLecture.profesor)
		}
	
	
	
	}
	}//View Controller Closing Bracket

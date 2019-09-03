//
//  ViewController.swift
//  ScheduleMaker
//
//  Created by Hugo Cruz on 8/22/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
	var managedContext: NSManagedObjectContext!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	override func viewWillAppear(_ animated: Bool) {
		guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
				return
		}
		let managedContext = appDelegate.persistentContainer.viewContext
		print(managedContext)
		extractFromHTML(claveDeseada: "2930" )
	}

}


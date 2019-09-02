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
		// 2
				
        func save(student_name: String,last_names : String, enrolledLectures: [NSManagedObject] ) {

			let entity = NSEntityDescription.entity(forEntityName: "Student",in: managedContext)!
			let dude = NSManagedObject(entity: entity, insertInto: managedContext)
						dude.setValue(student_name, forKeyPath: "student_name")
                        dude.setValue(last_names, forKeyPath:  "last_names")
                        dude.setValue(enrolledLectures, forKey: "enrolledLectures")
			// 4
			do {
				try managedContext.save()
				//people.append(person)
			} catch let error as NSError {
				print("Could not save. \(error), \(error.userInfo)")
			}
		}
			
		
	}

}


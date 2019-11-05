//
//  ViewControllerEliminar.swift
//  Proyecto Final
//
//  Created by Montse Caballero on 9/5/19.
//  Copyright © 2019 Montse Caballero. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerEliminar: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    
    let appDelegateEliminar = UIApplication.shared.delegate as! AppDelegate
    let managedContextEliminar = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var defaultUserEliminar: Student? = nil
	var populationForTableView: Set<Lecture>? = nil
	var arrayOfLectures: [Lecture] = [Lecture]()
    
    
    override func viewDidLoad(){
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		self.defaultUserEliminar = getStudentFromCoreData(appDelegate: self.appDelegateEliminar)
		
		self.tableView.isEditing = true

    }
	override func viewWillAppear(_ animated: Bool) {
		self.populationForTableView = self.defaultUserEliminar?.lectures as? Set<Lecture>
		self.arrayOfLectures.removeAll()
		for lecture in self.populationForTableView!{
			self.arrayOfLectures.append(lecture)
		}
		self.tableView.reloadData()
		
	
	}
	override func viewWillDisappear(_ animated: Bool) {
		
	}
    
	
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleLabel.center.x -= view.bounds.width
        
        UIView.animate(withDuration: 1.0, animations: {
                self.titleLabel.center.x += self.view.bounds.width
            })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.arrayOfLectures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! EliminarTableViewCell
		let usableElement = self.arrayOfLectures[indexPath.row]
		cell.teacherCell.text = usableElement.profesor
		cell.signatureCell.text = usableElement.nombreAsignatura
		cell.horaCell.text = " \(usableElement.hora_in) to " + " \(usableElement.hora_fin)"
		cell.claveAsignatura = String(usableElement.clave)
        //cell.horaCell.text = "\(horaIn[indexPath.row])0\n\(horaFin[indexPath.row])0".replacingOccurrences(of: ".", with: ":")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Materias inscritas"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Advertencia", message: "Seguro que quieres eliminar la materia", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
                //Cancel Action
            }))
            alert.addAction(UIAlertAction(title: "Aceptar",
                                          style: .default,
                                          handler: {(_: UIAlertAction!) in
											//let toDelete = fetchInstanceToDeleteFunction(clave: )
											let celda = tableView.cellForRow(at: indexPath) as? EliminarTableViewCell
											guard let toDelete = fetchInstanceToDeleteFunction(clave: Int(celda!.claveAsignatura)!,possibleUser: self.defaultUserEliminar, appDelegate : self.appDelegateEliminar) else {return}
											if (deleteLectureFromCoreData(lectureToRemove: toDelete, possibleUser: self.defaultUserEliminar, appDelegate: self.appDelegateEliminar) ){
												self.tableView.reloadData()
												self.viewWillAppear(true)
											}
                                           
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    


}

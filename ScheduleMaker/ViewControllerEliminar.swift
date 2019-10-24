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
    
    var clases = ["Matemáticas", "Historia", "Español"]
    var profesores = ["Hugo", "Juan", "Erick"]
	var deletableLecturesEnrolled = Set<Lecture>()
	var populationForTableView = Set<Lecture>()
    
    let appDelegateEliminar = UIApplication.shared.delegate as! AppDelegate
    let managedContextEliminar = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var defaultUserEliminar: Student? = nil
    
    
    override func viewDidLoad(){
		self.defaultUserEliminar = getStudentFromCoreData(appDelegate: self.appDelegateEliminar)
		self.deletableLecturesEnrolled = (self.defaultUserEliminar?.lectures as? Set<Lecture>)!
		self.populationForTableView = self.deletableLecturesEnrolled
		//self.deletableLecturesEnrolled = self.deletableLecturesEnrolled.intersection((self.defaultUserEliminar?.lectures as? Set<Lecture>)!)
        super.viewDidLoad()
        self.tableView.isEditing = true
    }
	override func viewWillAppear(_ animated: Bool) {
		//Intersection of deletable lectures with the new fetched lectures available.
		//If one lectures has been deleted, it will not appear on the new set.
		tableView.reloadData()
		
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
		return deletableLecturesEnrolled.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! EliminarTableViewCell
		let usableSetToPopulatetable = self.deletableLecturesEnrolled.popFirst()!
		cell.teacherCell.text = usableSetToPopulatetable.profesor
		cell.signatureCell.text = usableSetToPopulatetable.nombreAsignatura
		cell.horaCell.text = " \(usableSetToPopulatetable.hora_in) to " + " \(usableSetToPopulatetable.hora_fin)"
		cell.claveAsignatura = String(usableSetToPopulatetable.clave)
        //cell.horaCell.text = "\(horaIn[indexPath.row])0\n\(horaFin[indexPath.row])0".replacingOccurrences(of: ".", with: ":")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Materias inscritas"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Advertencia", message: "Seguro que quieres eliminar la materia \(clases[indexPath.row])", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
                //Cancel Action
            }))
            alert.addAction(UIAlertAction(title: "Aceptar",
                                          style: .default,
                                          handler: {(_: UIAlertAction!) in
											//let toDelete = fetchInstanceToDeleteFunction(clave: )
											let celda = tableView.cellForRow(at: indexPath) as? EliminarTableViewCell
											let toDelete = fetchInstanceToDeleteFunction(clave: Int(celda!.claveAsignatura)!,possibleUser: self.defaultUserEliminar, appDelegate : self.appDelegateEliminar)
											
                                            tableView.deleteRows(at: [indexPath], with: .automatic)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    


}

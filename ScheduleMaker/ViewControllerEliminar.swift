//
//  ViewControllerEliminar.swift
//  Proyecto Final
//
//  Created by Montse Caballero on 9/5/19.
//  Copyright © 2019 Montse Caballero. All rights reserved.
//

import UIKit

class ViewControllerEliminar: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var clases = ["Matemáticas", "Historia", "Español"]
    var profesores = ["Hugo", "Juan", "Erick"]
    var horaIn = [7.0, 8.0, 9.0]
    var horaFin = [9.0, 9.3, 11.0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
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
        return clases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! EliminarTableViewCell
        cell.teacherCell.text = profesores[indexPath.row]
        cell.signatureCell.text = clases[indexPath.row]
        cell.horaCell.text = "\(horaIn[indexPath.row])0\n\(horaFin[indexPath.row])0".replacingOccurrences(of: ".", with: ":")
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
                                            self.clases.remove(at: indexPath.item)
                                            self.profesores.remove(at: indexPath.item)
                                            self.horaIn.remove(at: indexPath.item)
                                            self.horaFin.remove(at: indexPath.item)
                                            
                                            tableView.deleteRows(at: [indexPath], with: .automatic)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }

}

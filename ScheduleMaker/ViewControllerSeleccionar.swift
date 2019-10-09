//
//  ViewControllerSeleccionar.swift
//  Proyecto Final
//
//  Created by Montse Caballero on 10/1/19.
//  Copyright © 2019 Montse Caballero. All rights reserved.
//

import UIKit

class ViewControllerSeleccionar: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titleLabelSeleccionar: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var claveMateria: [RamLecture]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        titleLabelSeleccionar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        titleLabelSeleccionar.center.x -= view.bounds.width
        titleLabelSeleccionar.isHidden = false
        
        UIView.animate(withDuration: 0.8, animations: {
            self.titleLabelSeleccionar.center.x += self.view.bounds.width
        })
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return claveMateria?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjetAddCell", for: indexPath) as! SeleccionarTableViewCell
        
		cell.maestroLabel?.text = String(claveMateria![indexPath.row].grupo)+"   " + "\(claveMateria![indexPath.row].hora_in)0-\(claveMateria![indexPath.row].hora_fin)0".replacingOccurrences(of: ".", with: ":")
		cell.materiaLabel?.text = claveMateria![indexPath.row].profesor
		cell.horaTexto?.text = "\(claveMateria![indexPath.row].hora_in)0\n\(claveMateria![indexPath.row].hora_fin)0".replacingOccurrences(of: ".", with: ":")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Materias a inscribir"
    }
    
    @IBAction func aceptarButtonAction(_ sender: Any) {
        let alert = UIAlertController(title: "Aviso", message: "Materia agregada con exito", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Aceptar",
                                      style: .default,
                                      handler: {(_: UIAlertAction!) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

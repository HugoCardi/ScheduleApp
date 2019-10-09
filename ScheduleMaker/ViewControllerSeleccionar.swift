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
    
    var posiblesGrupos: [RamLecture]? = nil
    
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
    
    func daysToArray(_ arrayDays: [Bool]) -> String{
        var horarioFinal: String = ""
        
        if arrayDays[0] == true {
            horarioFinal += "LUN-"
        }
        if arrayDays[1] == true {
            horarioFinal += "MAR-"
        }
        if arrayDays[2] == true {
            horarioFinal += "MIE-"
        }
        if arrayDays[3] == true {
            horarioFinal += "JUE-"
        }
        if arrayDays[4] == true {
            horarioFinal += "VIE-"
        }
        if arrayDays[5] == true {
            horarioFinal += "SAB-"
        }
        
        horarioFinal = String(horarioFinal.dropLast())
        return horarioFinal
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return posiblesGrupos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjetAddCell", for: indexPath) as! SeleccionarTableViewCell
        
        cell.infoText?.text = posiblesGrupos![indexPath.row].profesor+"\n\tGrupo:  "+String(posiblesGrupos![indexPath.row].grupo)+"\n\tHorario:   "
        cell.infoText?.text += daysToArray(posiblesGrupos![indexPath.row].arrayDays)
		cell.infoText?.text += "   " + posiblesGrupos![indexPath.row].horario!
        
        
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

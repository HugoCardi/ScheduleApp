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
	
    let appDelegateSeleccionar = UIApplication.shared.delegate as! AppDelegate
    let managedContextSeleccionar = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var defaultUser: Student? = nil
    
    override func viewDidLoad() {
		if let possibleUser = getStudentFromCoreData(appDelegate : appDelegateSeleccionar){
			self.defaultUser = possibleUser
		}else{
			return
		}
		
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
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
        
        let color: UIColor
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjetAddCell", for: indexPath) as! SeleccionarTableViewCell
        
        if indexPath.row % 2 == 0 {
            color = UIColor(red: 202/255, green: 211/255, blue: 159/255, alpha: 1.0)
        } else {
            color = UIColor(red: 213/255, green: 233/255, blue: 201/255, alpha: 1.0)
        }
        
        cell.infoText.backgroundColor = color
        cell.contentView.backgroundColor = color
        
        cell.outletButtonInscribir.layer.cornerRadius = 8.0
        
        cell.infoText?.text = posiblesGrupos![indexPath.row].profesor+"\n\tGrupo:  "+String(posiblesGrupos![indexPath.row].grupo)+"\n\tHorario:   "
        cell.infoText?.text += daysToArray(posiblesGrupos![indexPath.row].arrayDays)
		cell.infoText?.text += "   " + posiblesGrupos![indexPath.row].horario!
		cell.outletButtonInscribir.tag = posiblesGrupos![indexPath.row].grupo
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red: 84/255, green: 176/255, blue: 197/255, alpha: 1.0)
        
        let textView = UITextView()
        textView.isSelectable = false
        textView.backgroundColor = UIColor(red: 84/255, green: 176/255, blue: 197/255, alpha: 1.0)
        textView.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        textView.text = asignatura[String(posiblesGrupos![0].clave)]!.capitalized
        
        if asignatura[String(posiblesGrupos![0].clave)]!.count < 28{
            textView.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        } else if asignatura[String(posiblesGrupos![0].clave)]!.count < 55 {
            textView.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        } else {
                textView.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        }
        
        textView.textAlignment = .center
        textView.center.y = view.center.y
        textView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width - 5, height: 63)
        
        
        view.addSubview(textView)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 63
    }
    
    @IBAction func aceptarButtonAction(_ sender: Any) {
		let button = sender as! UIButton
		let userSelectedGroup = button.tag
        //let alert = UIAlertController(title: "Aviso", message: "Materia agregada con exito", preferredStyle: .alert)
		for item in self.posiblesGrupos!{
			if item.grupo == userSelectedGroup{
				let toEnroll = RamLectureToLecture(item, appDelegate: self.appDelegateSeleccionar)
				
				if(enrollLecture(lectureToEnroll: toEnroll, possibleUserInUse: self.defaultUser, appDelegate: self.appDelegateSeleccionar)){
					let alert = UIAlertController(title: "Aviso", message: "Materia agregada con exito", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                        //Ok Action
                    }))
					self.present(alert, animated: true, completion: nil)
					//self.dismiss(animated: true, completion: nil)
				}else{
					let alert = UIAlertController(title: "Error", message: "Error al agregar la materia ", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                        //Ok Action
                    }))
					self.present(alert, animated: true, completion: nil)
				}
			}
		}
		/*
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Aceptar",
                                      style: .default,
                                      handler: {(_: UIAlertAction!) in
										
        }))
		*/
        
    }
}

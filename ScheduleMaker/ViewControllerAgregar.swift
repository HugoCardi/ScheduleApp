//
//  ViewControllerAgregar.swift
//  Proyecto Final
//
//  Created by Montse Caballero on 9/5/19.
//  Copyright © 2019 Montse Caballero. All rights reserved.
//

import UIKit
import CoreData
import SwiftSoup

func delay(_ seconds: Double, completion: @escaping ()->Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

class ViewControllerAgregar: UIViewController{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var claveTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addRandomButton: UIButton!
    @IBOutlet weak var greenAirplane: UIImageView!
    @IBOutlet weak var orangeAirplane: UIImageView!
    @IBOutlet weak var blueAirplane: UIImageView!
    
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    let spinnerRandom = UIActivityIndicatorView(style: .whiteLarge)
    let messages = ["Searching ...", "Failed"]
    let label = UILabel()
    let status = UIImageView(image: UIImage(named: "banner"))
    var statusPosition = CGPoint.zero
    
    var centerAirplaneY = CGFloat(525)
    var centerAirplaneGreenY = CGFloat(650)
    var centerAirplaneBlueY = CGFloat(110)
    
    var isBottonPush: Bool = false
    var isLecture: Bool = false
	var materiaAgregada: (Bool, RamLecture?) = (false, nil)
    
    let appDelegateAgregar = UIApplication.shared.delegate as! AppDelegate
    let managedContextAgregar = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var defaultUserAgregar: Student? = nil
	
    override func viewDidLoad() {
		self.defaultUserAgregar = getStudentFromCoreDataAgregar()
        super.viewDidLoad()
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: true)
        claveTextField.inputAccessoryView = toolBar
        
        addButton.layer.cornerRadius = 8.0
        addButton.layer.masksToBounds = true
        addButton.center.y = CGFloat(275)
        addButton.center.x = view.bounds.width / 2
        
        addRandomButton.layer.cornerRadius = 8.0
        addRandomButton.layer.masksToBounds = true
        addRandomButton.center.y = addButton.center.y + 90
        addRandomButton.center.x = view.bounds.width / 2
        
        spinner.frame = CGRect(x: 27.0, y: 14.0, width: 20.0, height: 20.0)
        spinner.startAnimating()
        spinner.alpha = 0.0
        addButton.addSubview(spinner)
        
        spinnerRandom.frame = CGRect(x: 27.0, y: 14.0, width: 20.0, height: 20.0)
        spinnerRandom.startAnimating()
        spinnerRandom.alpha = 0.0
        addRandomButton.addSubview(spinnerRandom)
        
        status.isHidden = true
        status.center = addButton.center
        view.addSubview(status)
        
        label.frame = CGRect(x: 0.0, y: 0.0, width: status.frame.size.width, height: status.frame.size.height)
        label.font = UIFont(name: "HelveticaNeue", size: 18.0)
        label.textColor = UIColor(red: 0.89, green: 0.38, blue: 0.0, alpha: 1.0)
        label.textAlignment = .center
        status.addSubview(label)
        
        status.center.y = addButton.center.y + 23
        statusPosition = status.center
        
        greenAirplane.center.x = 0 - greenAirplane.frame.width
        greenAirplane.center.y = centerAirplaneGreenY
        greenAirplane.alpha = 0
        
        orangeAirplane.frame.origin.x = view.frame.size.width //290
        orangeAirplane.center.y = centerAirplaneY
        orangeAirplane.alpha = 0
        
        blueAirplane.frame.origin.x = view.frame.size.width
        blueAirplane.center.y = centerAirplaneBlueY
        blueAirplane.alpha = 0
        
        animatedAirplaneOrange(orangeAirplane)
        animatedAirplaneGreen(greenAirplane)
        //animatedAirplaneBlue(blueAirplane)
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {//metodo para puchar la pantalla y que se quite el teclado
        self.view.endEditing(true)//elimina el teclado de la pantalla. self=referencia de codigo
    }
    
    @IBAction func unwindToAgregar(unwindSegue: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ViewControllerSeleccionar
        
        vc?.posiblesGrupos = extractFromHTML(claveDeseada: claveTextField.text ?? "0000")
    }
    
	func getStudentFromCoreDataAgregar() -> Student?{
		do {
			let coreDataUsers = try managedContextAgregar.fetch(Student.fetchRequest())
			return coreDataUsers.first as? Student
		}catch let error as NSError{
			print("Could not fetch : \(error)")
		}
		return nil
	}
	
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addButton.center.y = CGFloat(275)
        addRandomButton.center.y = addButton.center.y + 90
        
		guard let currentlyInCoreData = self.defaultUserAgregar?.lectures as! Set<Lecture>? else{
			print("No Lectures enrolled in CoreData")
			return
		}
		for item in currentlyInCoreData{
			print("Clave \(item.clave) en grupo \(item.grupo)")
		}
		
        addButton.alpha = 0.0
        addRandomButton.alpha = 0.0
        
        /*greenAirplane.center.x = 0 - greenAirplane.frame.width
         greenAirplane.center.y = CGFloat(550)
         
         orangeAirplane.frame.origin.x = view.frame.size.width //290
         orangeAirplane.center.y = CGFloat(425)
         //orangeAirplane.alpha = 0
         
         blueAirplane.frame.origin.x = view.frame.size.width
         blueAirplane.center.y = CGFloat(110)
         //blueAirplane.alpha = 0*/
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        titleLabel.center.x -= view.bounds.width
        claveTextField.center.x -= view.bounds.width
        
        UIView.animate(withDuration: 0.8, animations: {
            self.titleLabel.center.x += self.view.bounds.width
        })
        
        UIView.animate(withDuration: 0.8, delay: 0.5, options: [], animations: {
            self.claveTextField.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
            self.addButton.center.y += 30
            self.addButton.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
            self.addRandomButton.center.y += 30
            self.addRandomButton.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
            self.greenAirplane.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
            self.orangeAirplane.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
            self.blueAirplane.alpha = 1.0
        }, completion: nil)
    }
    
	func enrollBestPossibleAutomatically(clave :String) -> (Bool, RamLecture?) {
		let possibleToEnroll = extractFromHTML(claveDeseada: clave)
		if let possibleToEnroll = possibleToEnroll{
			let bestOption = possibleToEnroll.randomElement()!
			let bestLectureOption = RamLectureToLecture(bestOption, appDelegate: self.appDelegateAgregar)
			let returnValue = enrollLecture(lectureToEnroll: bestLectureOption, possibleUserInUse: self.defaultUserAgregar!, appDelegate: self.appDelegateAgregar)
			return (returnValue, bestOption)
			//return enrollLecture(lectureToEnroll: RamLectureToLecture(possibleToEnroll.randomElement()!),studeny
		}else{
			print("Oh Oh. something has gone terribly wrong")
		}
		return (false, nil)
	}
    
    @IBAction func add(_ sender: Any) {
        guard let button = sender as? UIButton else {return}
		
        
        view.endEditing(true)
        
        isBottonPush = !isBottonPush
        
        if button.titleLabel?.text == "Quiero Elegir" {
            UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: { 
                self.addButton.bounds.size.width += 80
            }, completion: {_ in
                self.showMessage(index: 0)
				
				if asignatura[(self.claveTextField?.text!)!] != nil {
                    self.isLecture = true
                    self.performSegue(withIdentifier: "Selected", sender: nil)
                } else {
                    self.isLecture = false
                }
            })
            
            UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
                self.addButton.center.y += 60
                self.addButton.backgroundColor = UIColor(red: 246/255, green: 207/255, blue: 202/255, alpha: 1.0)
            }, completion: nil)
            
            UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
                self.addRandomButton.center.y += 60
                self.addRandomButton.backgroundColor = UIColor(red: 246/255, green: 207/255, blue: 202/255, alpha: 1.0)
            }, completion: nil)
            
            self.spinner.alpha = 1.0
            
			
        } else {
            
            if asignatura[(self.claveTextField?.text!)!] != nil {
                self.materiaAgregada = self.enrollBestPossibleAutomatically(clave: self.claveTextField.text!)
				self.isLecture = materiaAgregada.0
            } else {
                self.isLecture = false
            }
            
            UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
                self.addRandomButton.bounds.size.width += 80
            }, completion: {_ in
                self.showMessage(index: 0)
            })
            
            UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
                self.addRandomButton.center.y += 60
                self.addRandomButton.backgroundColor = UIColor(red: 246/255, green: 207/255, blue: 202/255, alpha: 1.0)
            }, completion: nil)
            
            UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
                self.addButton.center.y += 60
                self.addButton.backgroundColor = UIColor(red: 246/255, green: 207/255, blue: 202/255, alpha: 1.0)
            }, completion: nil)
            
            self.spinnerRandom.alpha = 1.0
        }
        
        self.addButton.isEnabled = false
        self.addRandomButton.isEnabled = false
    }
    
    func nothing(){
        print("nothing")
        return
    }
    
    func showMessage(index: Int) {
        label.text = messages[index]
        
        UIView.transition(with: status, duration: 0.33, options: [.curveEaseOut, .transitionCurlDown], animations: {
            self.status.isHidden = false
        }, completion: {_ in
            delay(2.0) {
                if !self.isLecture && index < self.messages.count - 1 {
                    self.removeMessage(index: index)
                } else {
                    self.resetForm()
                }
            }
        }
        )
    }
    
    func removeMessage(index: Int) {
        UIView.animate(withDuration: 0.33, delay: 0.0, options: [], animations: {
            self.status.center.x += self.view.frame.size.width
            self.status.center.y = self.addButton.center.y + 23
        }, completion: {_ in
            self.status.isHidden = true
            self.status.center = self.statusPosition
			
			self.showMessage(index: index+1)
        })
    }
    
    func resetForm() {
        UIView.transition(with: status, duration: 0.2, options: [.transitionCurlUp], animations: {
            self.status.isHidden = true
            self.status.center = self.statusPosition
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options: [], animations: {
            self.spinner.alpha = 0.0
            self.spinnerRandom.alpha = 0.0
            self.addButton.backgroundColor = UIColor(red: 0.6, green: 0.8, blue: 0.19, alpha: 1.0)
            self.addRandomButton.backgroundColor = UIColor(red: 0.6, green: 0.8, blue: 0.19, alpha: 1.0)
            self.addButton.center.y -= 60
            self.addRandomButton.center.y -= 60
            self.addButton.bounds.size.width = 260
            self.addRandomButton.bounds.size.width = 260
            self.addButton.isEnabled = true
            self.addRandomButton.isEnabled = true
            self.claveTextField.text = ""
        }, completion: {_ in
            if !self.isLecture {
                let alert = UIAlertController(title: "Error", message: "La clave no existe", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                    //Ok Action
                }))
                self.present(alert, animated: true, completion: nil)
			} else if self.materiaAgregada.1 != nil {
				let alert = UIAlertController(title: "Materia agregada exitosamente", message: "\(self.materiaAgregada.1!.nombreAsignatura)\nGrupo inscrito: \(self.materiaAgregada.1!.grupo)", preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
					//Ok Action
				}))
				self.present(alert, animated: true, completion: nil)
			}
        })
    }
    
    func animatedAirplaneOrange(_ airplane: UIImageView) {
        let airplaneSpeed = 30.0 / view.frame.size.width
        let durationAnimation = (view.frame.size.width) *  airplaneSpeed
        self.centerAirplaneY -= (75 + airplane.frame.height)
        
        UIView.animate(withDuration: TimeInterval(durationAnimation), delay: 0.0, options: .curveLinear, animations: {
            airplane.frame.origin.x = 0 - airplane.frame.width
            airplane.center.y = self.centerAirplaneY
        }, completion: {_ in
            airplane.frame.origin.x = self.view.frame.size.width
            
            if(airplane.frame.origin.y > 0 - airplane.frame.height){
                airplane.center.y = self.centerAirplaneY
            }else{
                self.centerAirplaneY = CGFloat(425)
                airplane.center.y = self.centerAirplaneY
            }
            
            self.animatedAirplaneOrange(airplane)
        })
    }
    
    func animatedAirplaneGreen(_ airplane: UIImageView) {
        let airplaneSpeed = 20.0 / view.frame.size.width
        let durationAnimation = (view.frame.size.width) *  airplaneSpeed
        self.centerAirplaneGreenY -= (85 + airplane.frame.height)
        
        UIView.animate(withDuration: TimeInterval(durationAnimation), delay: 0.0, options: .curveLinear, animations: {
            airplane.frame.origin.x = self.view.frame.width
            airplane.center.y = self.centerAirplaneGreenY
        }, completion: {_ in
            airplane.frame.origin.x = 0 - airplane.frame.width
            
            if(airplane.frame.origin.y > 0 - airplane.frame.height){
                airplane.center.y = self.centerAirplaneGreenY
            }else{
                self.centerAirplaneGreenY = CGFloat(550)
                airplane.center.y = self.centerAirplaneGreenY
            }
            
            self.animatedAirplaneGreen(airplane)
        })
    }
    
    func animatedAirplaneBlue(_ airplane: UIImageView) {
        let airplaneSpeed = 50.0 / view.frame.size.width
        let durationAnimation = (view.frame.size.width) *  airplaneSpeed
        self.centerAirplaneBlueY += (100 + airplane.frame.height)
        
        UIView.animate(withDuration: TimeInterval(durationAnimation), delay: 0.0, options: .curveLinear, animations: {
            airplane.frame.origin.x = 0 - airplane.frame.width
            airplane.center.y = self.centerAirplaneBlueY
        }, completion: {_ in
            airplane.frame.origin.x = self.view.frame.width
            
            if(airplane.frame.origin.y > 0 - airplane.frame.height){
                airplane.center.y = self.centerAirplaneBlueY
            }else{
                self.centerAirplaneBlueY = CGFloat(110)
                airplane.center.y = self.centerAirplaneBlueY
            }
            
            self.animatedAirplaneBlue(airplane)
        })
    }
}

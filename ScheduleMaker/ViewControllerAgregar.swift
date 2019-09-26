//
//  ViewControllerAgregar.swift
//  Proyecto Final
//
//  Created by Montse Caballero on 9/5/19.
//  Copyright © 2019 Montse Caballero. All rights reserved.
//

import UIKit
import CoreData

func delay(_ seconds: Double, completion: @escaping ()->Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

class ViewControllerAgregar: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var claveTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var greenAirplane: UIImageView!
    @IBOutlet weak var orangeAirplane: UIImageView!
    @IBOutlet weak var blueAirplane: UIImageView!
    
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    let messages = ["Searching ...", "Failed"]
    let label = UILabel()
    let status = UIImageView(image: UIImage(named: "banner"))
    var statusPosition = CGPoint.zero
    
    var centerAirplaneY = CGFloat(525)
    var centerAirplaneGreenY = CGFloat(650)
    var centerAirplaneBlueY = CGFloat(110)
    
    var isBottonPush: Bool = false
    
    let appDelegateAgregar = UIApplication.shared.delegate as! AppDelegate
    let managedContextAgregar = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var defaultUserAgregar: Student? = nil
    
    override func viewDidLoad() {
        self.defaultUserAgregar = getStudentFromCoreDataAgregar()
        super.viewDidLoad()
        
        print("Se carga Agregar")
        addButton.layer.cornerRadius = 8.0
        addButton.layer.masksToBounds = true
        addButton.center.y = claveTextField.center.y + 150
        addButton.center.x = view.bounds.width / 2
        
        spinner.frame = CGRect(x: 35.0, y: 17.0, width: 20.0, height: 20.0)
        spinner.startAnimating()
        spinner.alpha = 0.0
        addButton.addSubview(spinner)
        
        status.isHidden = true
        status.center = addButton.center
        view.addSubview(status)
        
        label.frame = CGRect(x: 0.0, y: 0.0, width: status.frame.size.width, height: status.frame.size.height)
        label.font = UIFont(name: "HelveticaNeue", size: 18.0)
        label.textColor = UIColor(red: 0.89, green: 0.38, blue: 0.0, alpha: 1.0)
        label.textAlignment = .center
        status.addSubview(label)
        
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
        
        addButton.alpha = 0.0
        
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
    
    func enrollLecture(lectureToEnroll: Lecture){
        let currentlyInCoreData = self.defaultUserAgregar?.lectures as! Set<Lecture>
        let starts = lectureToEnroll.hora_in
        let ends = lectureToEnroll.hora_fin
        for enrolledLecture in currentlyInCoreData{
            for iterator in Range(0 ... 5){
                if enrolledLecture.arrayDays[iterator] == lectureToEnroll.arrayDays[iterator]{
                    if  ((enrolledLecture.hora_in ... enrolledLecture.hora_fin).contains(starts) || (enrolledLecture.hora_in ... enrolledLecture.hora_fin).contains(ends)){
                        print("Error, time of new lecture is already busy.")
                        return
                    }
                    if(enrolledLecture.clave == lectureToEnroll.clave){
                        print("\n\n The Lecture has already been enrolled in another group")
                        return
                    }else if (lectureToEnroll.cupo == 0){
                        print("Error, No vacancy in the selected group")
                        return
                    }
                }
            }
        }
        defaultUserAgregar?.addToLectures(lectureToEnroll)
        print("Se ha agregado correctamente : \(lectureToEnroll.nombreAsignatura) en el grupo \(lectureToEnroll.grupo)")
        appDelegateAgregar.saveContext()
        return
        //to declare function to save lecture
    }

    @IBAction func add() {
        view.endEditing(true)
        
        isBottonPush = !isBottonPush
        
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
                self.addButton.bounds.size.width += 80
        }, completion: {_ in
            self.showMessage(index: 0)
        })
        
        UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
            self.addButton.center.y += 60
            self.addButton.backgroundColor = UIColor(red: 246/255, green: 207/255, blue: 202/255, alpha: 1.0)
        }, completion: nil)
        
        self.spinner.alpha = 1.0
        self.addButton.isEnabled = false
    }
    
    func showMessage(index: Int) {
        label.text = messages[index]
        
        UIView.transition(with: status, duration: 0.33, options: [.curveEaseOut, .transitionCurlDown], animations: {
            self.status.isHidden = false
        }, completion: {_ in
            delay(2.0) {
                if index < self.messages.count-1 {
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
            self.addButton.backgroundColor = UIColor(red: 0.6, green: 0.8, blue: 0.19, alpha: 1.0)
            self.addButton.center.y -= 60
            self.addButton.bounds.size.width -= 80
            self.addButton.isEnabled = true
            self.claveTextField.text = ""
        }, completion: nil)
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

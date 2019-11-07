//
//  ViewController.swift
//  Proyecto Final
//
//  Created by Montse Caballero on 9/3/19.
//  Copyright © 2019 Montse Caballero. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerHorario: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var titleLabel: UILabel!
	@IBOutlet weak var infoTextView: UITextView!
	
    var horaPar: Int = 0
    var horaNon: Int = 0
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var defaultUser: Student? = nil
	var lectures: Set<Lecture> = Set<Lecture>()
	
	var auxColor: Int = 0
	var colors = [
		UIColor(red: 132/255, green: 147/255, blue: 36/255, alpha: 1.0),
		UIColor(red: 61/255, green: 49/255, blue: 91/255, alpha: 1.0),
		UIColor(red: 1.0, green: 107/255, blue: 107/255, alpha: 1.0),
		UIColor(red: 1.0, green: 140/255, blue: 66/255, alpha: 1.0),
		UIColor(red: 132/255, green: 161/255, blue: 140/255, alpha: 1.0),
		UIColor(red: 143/255, green: 45/255, blue: 86/255, alpha: 1.0),
		UIColor(red: 11/255, green: 122/255, blue: 117/255, alpha: 1.0),
		UIColor(red: 100/255, green: 94/255, blue: 157/255, alpha: 1.0),
		UIColor(red: 188/255, green: 231/255, blue: 132/255, alpha: 1.0),
		UIColor(red: 241/255, green: 89/255, blue: 70/255, alpha: 1.0),
		UIColor(red: 188/255, green: 1.0, blue: 219/255, alpha: 1.0),
		UIColor(red: 237/255, green: 203/255, blue: 150/255, alpha: 1.0),
		UIColor(red: 151/255, green: 115/255, blue: 144/255, alpha: 1.0),
		UIColor(red: 1.0, green: 166/255, blue: 158/255, alpha: 1.0),
		UIColor(red: 56/255, green: 119/255, blue: 128/255, alpha: 1.0),
		UIColor(red: 204/255, green: 218/255, blue: 209/255, alpha: 1.0),
		UIColor(red: 25/255, green: 100/255, blue: 126/255, alpha: 1.0),
		UIColor(red: 1.0, green: 227/255, blue: 129/255, alpha: 1.0),
		UIColor(red: 244/255, green: 211/255, blue: 94/255, alpha: 1.0),
		UIColor(red: 17/255, green: 157/255, blue: 164/255, alpha: 1.0)]
	
	var arrayItemsPos = [[Int]] ()
	var arrayItemsColor = [[Int]] ()
	var arrayItemsIniOFin = [[Int]] ()
	var arrayItemsCuartos = [[Bool]] ()
	var arrayClaves = [Int32] ()
    
    override func viewDidLoad() {
		self.defaultUser = getStudentFromCoreData(appDelegate: self.appDelegate)
        super.viewDidLoad()
    }
    
	override func viewWillAppear(_ animated: Bool) {
		self.collectionView.reloadData()
		self.lectures = Set<Lecture>()
		self.lectures = self.lectures.union(self.defaultUser?.lectures as! Set<Lecture>)
		
		self.arrayItemsPos.removeAll()
		self.arrayItemsColor.removeAll()
		self.arrayItemsIniOFin.removeAll()
		self.arrayItemsCuartos.removeAll()
		
		for lecture in self.lectures {
			populateSchedule(days: lecture.arrayDays, firstHour: lecture.hora_in, secondHour: lecture.hora_fin)
			self.arrayClaves.append(lecture.clave)
		}

		self.collectionView.reloadData()
	}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: (view.bounds.width - 20) / 7, height: collectionView.bounds.width/12)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView!.collectionViewLayout = layout
        
        titleLabel.center.x -= view.bounds.width
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [ ], animations: {
            self.titleLabel.center.x += self.view.bounds.width
        }, completion: nil)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 217
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Time", for: indexPath) as! HorarioCollectionViewCell
		
		cell.layer.borderColor = UIColor.darkGray.cgColor
		cell.layer.borderWidth = 0.3
		
        switch indexPath.item {
            case 0:
                cell.colorHora.text = "Hora"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 1:
                cell.colorHora.text = "Lun"
                cell.colorHora.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
            case 2:
                cell.colorHora.text = "Mar"
                cell.colorHora.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
            case 3:
                cell.colorHora.text = "Mie"
                cell.colorHora.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
            case 4:
                cell.colorHora.text = "Jue"
                cell.colorHora.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
            case 5:
                cell.colorHora.text = "Vie"
                cell.colorHora.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
            case 6:
                cell.colorHora.text = "Sab"
                cell.colorHora.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
            case 7:
                cell.colorHora.text = "7:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 14:
                cell.colorHora.text = "7:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 21:
                cell.colorHora.text = "8:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 28:
                cell.colorHora.text = "8:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 35:
                cell.colorHora.text = "9:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 42:
                cell.colorHora.text = "9:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 49:
                cell.colorHora.text = "10:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 56:
                cell.colorHora.text = "10:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 63:
                cell.colorHora.text = "11:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 70:
                cell.colorHora.text = "11:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 77:
                cell.colorHora.text = "12:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 84:
                cell.colorHora.text = "12:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 91:
                cell.colorHora.text = "13:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 98:
                cell.colorHora.text = "13:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 105:
                cell.colorHora.text = "14:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 112:
                cell.colorHora.text = "14:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 119:
                cell.colorHora.text = "15:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 126:
                cell.colorHora.text = "15:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 133:
                cell.colorHora.text = "16:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 140:
                cell.colorHora.text = "16:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 147:
                cell.colorHora.text = "17:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 154:
                cell.colorHora.text = "17:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 161:
                cell.colorHora.text = "18:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 168:
                cell.colorHora.text = "18:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 175:
                cell.colorHora.text = "19:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 182:
                cell.colorHora.text = "19:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 189:
                cell.colorHora.text = "20:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 196:
                cell.colorHora.text = "20:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 203:
                cell.colorHora.text = "21:00"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 210:
                cell.colorHora.text = "21:30"
                cell.colorHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
                cell.colorMediaHora.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            default:
				cell.colorHora.text = " "
				cell.colorHora.backgroundColor = UIColor(red: 179/256, green: 197/256, blue: 215/256, alpha: 1)
				cell.colorMediaHora.backgroundColor = UIColor(red: 179/256, green: 197/256, blue: 215/256, alpha: 1)
				//Color prueba
				//UIColor(red: 252/256, green: 220/256, blue: 77/256, alpha: 1)
		
					for i in 0..<self.arrayItemsPos.count {
						for j in 0...(self.arrayItemsPos[i].count - 1) {
							if indexPath.item == self.arrayItemsPos[i][j] {
								
								cell.colorHora.backgroundColor = self.colors[self.arrayItemsColor[i][j]]
								cell.colorMediaHora.backgroundColor = self.colors[self.arrayItemsColor[i][j]]
								
								if self.arrayItemsIniOFin[i][j] == 1 && self.arrayItemsCuartos[i][j] {
									cell.colorMediaHora.backgroundColor = self.colors[self.arrayItemsColor[i][j]]
									cell.colorHora.backgroundColor = UIColor(red: 179/256, green: 197/256, blue: 215/256, alpha: 1)
								}
								
								if self.arrayItemsIniOFin[i][j] == -1 && self.arrayItemsCuartos[i][j] {
									cell.colorHora.backgroundColor = self.colors[self.arrayItemsColor[i][j]]
									cell.colorMediaHora.backgroundColor = UIColor(red: 179/256, green: 197/256, blue: 215/256, alpha: 1)
								}
							}//Termina Segundo For
						}//Termina Primer For
					}
					
			}//Termina Switch
		
        return cell
    }
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		if indexPath.item > 7 && indexPath.item % 7 != 0 {
			self.infoTextView.text = String(indexPath.item)
		} else {
			self.infoTextView.text = nil
		}
	}
	
	func populateSchedule(days: [Bool], firstHour: Float, secondHour: Float) {
		var bloques = Int(ceil((secondHour-firstHour))/0.5)
		
		var fila = 1
		var memoFila = fila
		var columna = 1
		
		var auxArrayPos = [Int] ()
		var auxArrayColor = [Int] ()
		var auxArrayIniOFin = [Int] ()
		var auxArrayCuartos = [Bool] ()
		
		if firstHour < 7.3 {
			fila = 1
		} else if firstHour < 8.0 {
			fila = 2
		} else if firstHour < 8.3 {
			fila = 3
		} else if firstHour < 9.0 {
			fila = 4
		} else if firstHour < 9.3 {
			fila = 5
		} else if firstHour < 10.0 {
			fila = 6
		} else if firstHour < 10.3 {
			fila = 7
		} else if firstHour < 11.0 {
			fila = 8
		} else if firstHour < 11.3 {
			fila = 9
		} else if firstHour < 12.0 {
			fila = 10
		} else if firstHour < 12.3 {
			fila = 11
		} else if firstHour < 13 {
			fila = 12
		} else if firstHour < 13.3 {
			fila = 13
		} else if firstHour < 14.0 {
			fila = 14
		} else if firstHour < 14.3 {
			fila = 15
		} else if firstHour < 15.0 {
			fila = 16
		} else if firstHour < 15.3 {
			fila = 17
		} else if firstHour < 16.0 {
			fila = 18
		} else if firstHour < 16.3 {
			fila = 19
		} else if firstHour < 17.0 {
			fila = 20
		} else if firstHour < 17.3 {
			fila = 21
		} else if firstHour < 18.0 {
			fila = 22
		} else if firstHour < 18.3 {
			fila = 23
		} else if firstHour < 19.0 {
			fila = 24
		} else if firstHour < 19.3 {
			fila = 25
		} else if firstHour < 20.0 {
			fila = 26
		} else if firstHour < 20.3 {
			fila = 27
		} else if firstHour < 21.0 {
			fila = 28
		} else if firstHour < 21.3 {
			fila = 29
		} else if firstHour < 22.0 {
			fila = 30
		}
		
		memoFila = fila
		
		if String(firstHour).contains(".3") {
			bloques -= 1
		}
		
		for bandera in days {
			if bandera {
				var banderaHoraInicio = false
				var banderaHoraFin = false
				
				if String(firstHour).contains(".15") || String(firstHour).contains(".45") {
					banderaHoraInicio = true
				} else {
					banderaHoraInicio = false
				}
				
				if String(secondHour).contains(".15") || String(secondHour).contains(".45") {
					banderaHoraFin = true
				}else {
					banderaHoraFin = false
				}
				
				for i in 1...bloques {
					var auxPos = 0
					var auxBool = false
					
					if i == 1{
						auxPos = 1
						auxBool = banderaHoraInicio
					} else if i == bloques{
						auxPos = -1
						auxBool = banderaHoraFin
					} else {
						auxPos = 0
						auxBool = false
					}
					
					auxArrayPos.append(7 * fila + columna)
					auxArrayColor.append(self.auxColor)
					auxArrayIniOFin.append(auxPos)
					auxArrayCuartos.append(auxBool)
					fila += 1
				}
			}
			columna += 1
			fila = memoFila
		}
		
		self.arrayItemsPos.append(auxArrayPos)
		self.arrayItemsColor.append(auxArrayColor)
		self.arrayItemsIniOFin.append(auxArrayIniOFin)
		self.arrayItemsCuartos.append(auxArrayCuartos)
		
		self.auxColor += 1
		
		if self.auxColor == colors.count{
			self.auxColor = 0
		}
	}
}


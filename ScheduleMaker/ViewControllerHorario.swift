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
    
    override func viewDidLoad() {
        self.defaultUser = getStudentFromCoreData()
        super.viewDidLoad()
    }
    
    func getStudentFromCoreData() -> Student?{
        do {
            let coreDataUsers = try managedContext.fetch(Student.fetchRequest())
            return coreDataUsers.first as? Student
        }catch let error as NSError{
            print("Could not fetch : \(error)")
        }
        return nil
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
        
		cell.colorHora.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
		
        switch indexPath.row {
            case 0:
                cell.colorHora.text = "Hora"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 1:
                cell.colorHora.text = "Lun"
                cell.contentView.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
            case 2:
                cell.colorHora.text = "Mar"
                cell.contentView.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
            case 3:
                cell.colorHora.text = "Mie"
                cell.contentView.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
            case 4:
                cell.colorHora.text = "Jue"
                cell.contentView.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
            case 5:
                cell.colorHora.text = "Vie"
                cell.contentView.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
            case 6:
                cell.colorHora.text = "Sab"
                cell.contentView.backgroundColor = UIColor(red: 155/256, green: 197/256, blue: 61/256, alpha: 1)
            case 7:
                cell.colorHora.text = "7:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 14:
                cell.colorHora.text = "7:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 21:
                cell.colorHora.text = "8:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 28:
                cell.colorHora.text = "8:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 35:
                cell.colorHora.text = "9:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 42:
                cell.colorHora.text = "9:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 49:
                cell.colorHora.text = "10:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 56:
                cell.colorHora.text = "10:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 63:
                cell.colorHora.text = "11:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 70:
                cell.colorHora.text = "11:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 77:
                cell.colorHora.text = "12:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 84:
                cell.colorHora.text = "12:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 91:
                cell.colorHora.text = "13:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 98:
                cell.colorHora.text = "13:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 105:
                cell.colorHora.text = "14:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 112:
                cell.colorHora.text = "14:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 119:
                cell.colorHora.text = "15:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 126:
                cell.colorHora.text = "15:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 133:
                cell.colorHora.text = "16:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 140:
                cell.colorHora.text = "16:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 147:
                cell.colorHora.text = "17:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 154:
                cell.colorHora.text = "17:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 161:
                cell.colorHora.text = "18:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 168:
                cell.colorHora.text = "18:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 175:
                cell.colorHora.text = "19:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 182:
                cell.colorHora.text = "19:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 189:
                cell.colorHora.text = "20:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 196:
                cell.colorHora.text = "20:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 203:
                cell.colorHora.text = "21:00"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            case 210:
                cell.colorHora.text = "21:30"
                cell.contentView.backgroundColor = UIColor(red: 70/256, green: 106/256, blue: 143/256, alpha: 1)
            default:
				cell.colorHora.text = nil
				cell.colorHora.textColor = UIColor(red: 84/255, green: 84/255, blue: 84/255, alpha: 1)
                cell.contentView.backgroundColor = UIColor(red: 179/256, green: 197/256, blue: 215/256, alpha: 1)
        }
        
        return cell
    }
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		if indexPath.row > 7 && indexPath.row % 7 != 0 {
			self.infoTextView.text = String(indexPath.row)
		} else {
			self.infoTextView.text = nil
		}
	}
}


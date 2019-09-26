//
//  ViewController.swift
//  Proyecto Final
//
//  Created by Montse Caballero on 9/3/19.
//  Copyright © 2019 Montse Caballero. All rights reserved.
//

import UIKit

class ViewControllerHorario: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var titleLabel: UILabel!
    
    var horaPar: Int = 0
    var horaNon: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width/7, height: view.bounds.width/15)
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
        
        //cell.colorHora.backgroundColor = UIColor(red: 75.0, green: 199.0, blue: 211.0, alpha: 1.0)
        switch indexPath.row {
            case 0:
                cell.colorHora.text = "Hora"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 1:
                cell.colorHora.text = "Lun"
                cell.contentView.backgroundColor = UIColor(red: 75/256, green: 199/256, blue: 211/256, alpha: 1)
            case 2:
                cell.colorHora.text = "Mar"
                cell.contentView.backgroundColor = UIColor(red: 75/256, green: 199/256, blue: 211/256, alpha: 1)
            case 3:
                cell.colorHora.text = "Mie"
                cell.contentView.backgroundColor = UIColor(red: 75/256, green: 199/256, blue: 211/256, alpha: 1)
            case 4:
                cell.colorHora.text = "Jue"
                cell.contentView.backgroundColor = UIColor(red: 75/256, green: 199/256, blue: 211/256, alpha: 1)
            case 5:
                cell.colorHora.text = "Vie"
                cell.contentView.backgroundColor = UIColor(red: 75/256, green: 199/256, blue: 211/256, alpha: 1)
            case 6:
                cell.colorHora.text = "Sab"
                cell.contentView.backgroundColor = UIColor(red: 75/256, green: 199/256, blue: 211/256, alpha: 1)
            case 7:
                cell.colorHora.text = "7:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 14:
                cell.colorHora.text = "7:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 21:
                cell.colorHora.text = "8:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 28:
                cell.colorHora.text = "8:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 35:
                cell.colorHora.text = "9:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 42:
                cell.colorHora.text = "9:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 49:
                cell.colorHora.text = "10:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 56:
                cell.colorHora.text = "10:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 63:
                cell.colorHora.text = "11:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 70:
                cell.colorHora.text = "11:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 77:
                cell.colorHora.text = "12:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 84:
                cell.colorHora.text = "12:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 91:
                cell.colorHora.text = "13:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 98:
                cell.colorHora.text = "13:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 105:
                cell.colorHora.text = "14:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 112:
                cell.colorHora.text = "14:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 119:
                cell.colorHora.text = "15:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 126:
                cell.colorHora.text = "15:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 133:
                cell.colorHora.text = "16:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 140:
                cell.colorHora.text = "16:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 147:
                cell.colorHora.text = "17:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 154:
                cell.colorHora.text = "17:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 161:
                cell.colorHora.text = "18:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 168:
                cell.colorHora.text = "18:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 175:
                cell.colorHora.text = "19:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 182:
                cell.colorHora.text = "19:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 189:
                cell.colorHora.text = "20:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 196:
                cell.colorHora.text = "20:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 203:
                cell.colorHora.text = "21:00"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            case 210:
                cell.colorHora.text = "21:30"
                cell.contentView.backgroundColor = UIColor(red: 130/256, green: 178/256, blue: 42/256, alpha: 1)
            default:
                cell.colorHora.text = "Otro"
                cell.contentView.backgroundColor = UIColor(red: 244/256, green: 178/256, blue: 41/256, alpha: 1)
        }
        

        
        return cell
    }
}


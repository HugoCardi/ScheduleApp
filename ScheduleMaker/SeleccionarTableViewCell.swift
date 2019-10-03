//
//  SeleccionarTableViewCell.swift
//  Proyecto Final
//
//  Created by Montse Caballero on 10/1/19.
//  Copyright © 2019 Montse Caballero. All rights reserved.
//

import UIKit

class SeleccionarTableViewCell: UITableViewCell {

    @IBOutlet weak var materiaLabel: UILabel!
    @IBOutlet weak var maestroLabel: UILabel!
    @IBOutlet weak var horaTexto: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

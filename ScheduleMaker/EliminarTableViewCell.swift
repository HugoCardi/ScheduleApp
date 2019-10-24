//
//  TableViewCell.swift
//  Proyecto Final
//
//  Created by Montse Caballero on 9/19/19.
//  Copyright © 2019 Montse Caballero. All rights reserved.
//

import UIKit

class EliminarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var horaCell: UITextView!
    @IBOutlet weak var signatureCell: UILabel!
    @IBOutlet weak var teacherCell: UILabel!
	var claveAsignatura: String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

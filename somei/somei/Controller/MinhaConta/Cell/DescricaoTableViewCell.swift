//
//  DescricaoTableViewCell.swift
//  Somei
//
//  Created by João Conrado Santana de Lima Dembiski on 09/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class DescricaoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var DescricaoTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

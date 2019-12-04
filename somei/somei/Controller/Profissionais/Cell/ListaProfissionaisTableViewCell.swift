//
//  ListaProfissionaisTableViewCell.swift
//  Somei
//
//  Created by Cristiano Correia on 02/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class ListaProfissionaisTableViewCell: UITableViewCell {

    @IBOutlet var lblNomeProfissional: UILabel!
    @IBOutlet var lblDistanciaProfissional: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

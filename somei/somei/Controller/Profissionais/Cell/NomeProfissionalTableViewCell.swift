//
//  NomeProfissionalTableViewCell.swift
//  Somei
//
//  Created by Cristiano Correia on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class NomeProfissionalTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNomeProfissional: UILabel!
    @IBOutlet weak var imgProfissional: UIImageView!
    @IBOutlet weak var imgAvaliacao: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  AvaliacaoProfissionalTableViewCell.swift
//  Somei
//
//  Created by Cristiano Correia on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class AvaliacaoProfissionalTableViewCell: UITableViewCell {

    @IBOutlet weak var umaEstrela: UIButton!
    @IBOutlet weak var duasEstrela: UIButton!
    @IBOutlet weak var tresEstrela: UIButton!
    @IBOutlet weak var quatroEstrela: UIButton!
    @IBOutlet weak var cincoEstrela: UIButton!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  CadastroMEIViewController.swift
//  Somei
//
//  Created by João Conrado Santana de Lima Dembiski on 06/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class CadastroMEIViewController: UIViewController {

    @IBOutlet weak var cadastrarMEIbutton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.transparentNavigationBar()
        self.navigationController?.navigationBar.tintColor = UIColor.white

        // Do any additional setup after loading the view.
    }
    
    @IBAction func linkCadastrarButton(_ sender: Any) {
        if let url = URL(string: "https://www.portalmaisempreendedor.com.br/registro/?gclid=CjwKCAiAlajvBRB_EiwA4vAqiOgtEInghk4X3mjTr_z23ZgfhEYu8lMS1upXfMzpjCAiKK-Qm3Qj7BoCShkQAvD_BwE") {
            UIApplication.shared.open(url)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

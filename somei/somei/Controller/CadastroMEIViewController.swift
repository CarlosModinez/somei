//
//  CadastroMEIViewController.swift
//  Somei
//
//  Created by Felipe Mesquita on 10/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class CadastroMEIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func criarMEI(_ sender: Any) {
        if let url = URL(string: "https://www.portalmaisempreendedor.com.br/registro/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
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

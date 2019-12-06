//
//  LoginViewController.swift
//  Somei
//
//  Created by José Guilherme Bestel on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.transparentNavigationBar()
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches as! Set<UITouch>, with: event)
        view.endEditing(true)
    }
    
    @IBAction func cadastrar(_ sender: Any) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "cadastroViewController") as? CadastroViewController{
            
            vc.acharClientes = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


extension UINavigationBar {
    func transparentNavigationBar() {
    self.setBackgroundImage(UIImage(), for: .default)
    self.shadowImage = UIImage()
    self.isTranslucent = true
    }
}

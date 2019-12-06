//
//  CadastroDoisViewController.swift
//  Somei
//
//  Created by José Guilherme Bestel on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class CadastroDoisViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var senha: UITextField!
    @IBOutlet var confirmSenha: UITextField!
    
    var user :Usuario = Usuario()
    var senhaUser :String = ""
    var acharClientes :Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches as! Set<UITouch>, with: event)
        view.endEditing(true)
    }
    
    @IBAction func prosseguir(_ sender: Any) {
        self.user.email = email.text ?? ""
        self.senhaUser = senha.text ?? ""
        
        print("usuario: \(self.user.nome)\n\(self.user.cadastroPessoaFisicaOuJuridica)\n\(self.user.telefone)\n\(self.user.email)\n\(self.senhaUser)")
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "cadastroTresViewController") as? CadastroTresViewController{
            vc.user = self.user
            vc.senhaUser = self.senhaUser
            vc.acharClientes = self.acharClientes
            self.navigationController?.pushViewController(vc, animated: true)
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

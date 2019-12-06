//
//  CadastroViewController.swift
//  Somei
//
//  Created by José Guilherme Bestel on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var nome: UITextField!
    @IBOutlet var cpfCnpj: UITextField!
    @IBOutlet var telefone: UITextField!
    
    let user: Usuario = Usuario()
    var acharClientes :Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//        view.addGestureRecognizer(tap)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches as! Set<UITouch>, with: event)
        view.endEditing(true)
    }
    
    
    @IBAction func prosseguir(_ sender: Any) {
        
        self.user.nome = nome.text ?? ""
        self.user.cadastroPessoaFisicaOuJuridica = cpfCnpj.text ?? ""
        self.user.telefone = telefone.text ?? ""
        
        print("usuario: \(self.user.nome)\n\(self.user.cadastroPessoaFisicaOuJuridica)\n\(self.user.telefone)")
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "cadastroDoisViewController") as? CadastroDoisViewController{
            vc.user = self.user
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

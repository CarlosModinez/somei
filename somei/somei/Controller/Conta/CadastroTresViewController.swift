//
//  CadastroTresViewController.swift
//  Somei
//
//  Created by José Guilherme Bestel on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class CadastroTresViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var imgUser: UIImageView!
    @IBOutlet var descricaoAtividade: UITextField!
    @IBOutlet var encontrarClienteView: UIView!
    @IBOutlet var descAtivLabel: UILabel!
    @IBOutlet var descAtivInput: UITextField!
    @IBOutlet var descricao: UILabel!
    
    var user :Usuario = Usuario()
    var senhaUser :String = ""
    var acharClientes :Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgUser.image = UIImage(named: "user")
        
        if(user.cadastroPessoaFisicaOuJuridica.count > 11){
            print("é um cnpj")
            //Habilitar opção de encontrar um cliente
            self.encontrarClienteView.isHidden = false
            self.descAtivLabel.isHidden = false
            self.descAtivInput.isHidden = false
            self.descricao.isHidden = false
        }else{
            //Desabilitar opção de encontrar um cliente
            self.encontrarClienteView.isHidden = true
            self.descAtivLabel.isHidden = true
            self.descAtivInput.isHidden = true
            self.descricao.isHidden = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches as! Set<UITouch>, with: event)
        view.endEditing(true)
    }
    
    @IBAction func concluir(_ sender: Any) {
        
        //Criar usuario
        
        
        //Retornar para a tela de login
        self.navigationController?.popToViewController((self.navigationController?.viewControllers[0])!, animated: true)
    }
    
    @IBAction func encontrarCliente(_ sender: Any) {
        print("clicou encontrar cliente")
    }
    
    @IBAction func buscarFoto(_ sender: Any) {
        print("clicou em buscar foto")
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

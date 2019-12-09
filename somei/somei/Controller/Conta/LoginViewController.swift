//
//  LoginViewController.swift
//  Somei
//
//  Created by José Guilherme Bestel on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit
import FirebaseUI
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var handle :AuthStateDidChangeListenerHandle!
    var isLogado :Bool = false
    var voltarPara :String = "perfil"
    
    @IBOutlet var emailLogin: UITextField!
    @IBOutlet var senhaLogin: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.transparentNavigationBar()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        //mark: Implementar o model aqui
//        if(Model.instance.isLogado){
            //MARK: SEGUE PARA A PAGINA DE PROFISSIONAIS
//        }
    }
    

    //Detecta o estado de autenticação
//    override func viewWillAppear(_ animated: Bool) {
//        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//            print("estado login: \(user?.email ?? nil ?? "none")")
//            print("Email usuario: \(user?.email?.isEmpty)")
//            if(user?.email?.isEmpty ?? true){
//                print("sem usuario")
//            }else{
//                self.isLogado = true
//            }
//        }
//    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches as! Set<UITouch>, with: event)
        view.endEditing(true)
    }
    
    @IBAction func entrar(_ sender: Any) {
        
        print(self.voltarPara)
        
        Auth.auth().signIn(withEmail: self.emailLogin.text ?? "", password: self.senhaLogin.text ?? "") { [weak self] authResult, error in
            guard self != nil else { return }
            print("usuario \(authResult?.user.email ?? nil) logado")
            self?.isLogado = true
            
            //MARK: DESCOMENTAR LINHA ABAIXO
//            Model.instance.isLogado = true
            
            //Segue para pagina a retornar
            print("mudar tela")
            if(self?.voltarPara == "perfil"){
                //MARK: Achar o id e classe para a página q vai
                if let vc = self?.storyboard?.instantiateViewController(withIdentifier: "procurarProfissionaisViewController") as? ProcurarProfissionaisViewController{
                    self?.navigationController?.present(vc, animated: true, completion: {

                    })
                }
            }else{
                //MARK: Achar o id e classe para a página q vai
                if let vc = self?.storyboard?.instantiateViewController(withIdentifier: "procurarProfissionaisViewController") as? ProcurarProfissionaisViewController{
                    self?.navigationController?.present(vc, animated: true, completion: {

                    })
                }
            }
        }
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

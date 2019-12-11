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
        senhaLogin.delegate = self
        emailLogin.delegate = self
        self.navigationController?.navigationBar.transparentNavigationBar()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        if(Model.instance.isLogado){
            self.proximaPagina()
        }
    }

    //Detecta o estado de autenticação
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            print("estado login: \(user?.email ?? nil ?? "none")")
            print("Email usuario: \(user?.email?.isEmpty)")
            if(user?.email?.isEmpty ?? true){
                print("sem usuario")
            }else{
                Model.instance.isLogado = true
                self.emailLogin.text = user?.email
                DAOFireBAseUsuario.buscarUsuarioPeloEmail(email: (user?.email)!) { (usuario) in
                    Model.instance.usuario = usuario

                    //Segue para pagina a retornar
                    print("mudar tela")
                    self.proximaPagina()
                }
                //self.proximaPagina()
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches as! Set<UITouch>, with: event)
        view.endEditing(true)
    }
    
    @IBAction func entrar(_ sender: Any) {
        
        print(self.voltarPara)
        
        Auth.auth().signIn(withEmail: self.emailLogin.text ?? "", password: self.senhaLogin.text ?? "") { [weak self] authResult, error in
            guard self != nil else { return }
            print("usuario \(authResult?.user.email ?? "none") logado")
            self?.isLogado = true
            Model.instance.isLogado = true
            
            //Atribuir usuario
            DAOFireBAseUsuario.buscarUsuarioPeloEmail(email: (self?.emailLogin.text)!) { (usuario) in
                Model.instance.usuario = usuario

                //Segue para pagina a retornar
                print("mudar tela")
                self?.proximaPagina()
            }
            
        }
    }
    
    @IBAction func cadastrar(_ sender: Any) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "cadastroViewController") as? CadastroViewController{
            
            vc.acharClientes = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func proximaPagina(){
        if(self.voltarPara == "perfil"){
            //MARK: Achar o id e classe para a página q vai
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBar") as? UITabBarController {
                
                self.dismiss(animated: true, completion:  {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "logou"), object: nil)
//                    self.navigationController!.setViewControllers([vc], animated: true)
                })
                
            }
        }else{
            print("Indo para os profissionais")
            //MARK: Achar o id e classe para a página q vai
            if let vc = UIStoryboard(name: "Profissionais", bundle: nil).instantiateViewController(withIdentifier: "ProcurarProfissionaisViewController") as? ProcurarProfissionaisViewController{
                navigationController?.setViewControllers([vc], animated: true)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("ddddd")
        if textField == emailLogin {
            senhaLogin.becomeFirstResponder()
            return true
        }
        
        textField.resignFirstResponder()
        return true
    }
}

extension UINavigationBar {
    func transparentNavigationBar() {
    self.setBackgroundImage(UIImage(), for: .default)
    self.shadowImage = UIImage()
    self.isTranslucent = true
    }
}

//
//  PrincipalViewController.swift
//  Somei
//
//  Created by José Guilherme Bestel on 29/11/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit
import FirebaseUI

class PrincipalViewController: UIViewController {
    
    var handle :AuthStateDidChangeListenerHandle!
    @IBOutlet var emailLogin: UITextField!
    @IBOutlet var senhaLogin: UITextField!
    
    var isLogado :Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        criarUsuario(email: "josegbestel@gmail.com", password: "Abc@12345")
        loginUsuario(email: "josegbestel@gmail.com", password: "Abc@12345")

        // Do any additional setup after loading the view.
    }
    
    //Detecta o estado de autenticação
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            self.isLogado = true
            print("estado login: \(user?.email ?? nil)")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    //Criar novo usuario
    func criarUsuario(email :String, password :String){
        print("criar usuario")
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            print("usuario \(authResult?.user.email ?? nil) criado")
        }
    }
    
    //Login usuario existente
    func loginUsuario(email :String, password :String){
        print("login usuario")
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard self != nil else { return }
            print("usuario \(authResult?.user.email ?? nil) logado")
        
        }
    }
    
    @IBAction func logar(_ sender: Any) {
        if emailLogin.text! != nil && senhaLogin! != nil{
            loginUsuario(email: emailLogin.text!, password: senhaLogin.text!)
        }else{
            print("Campos de login vazios")
        }
    }
    
    @IBAction func verificarLogin(_ sender: Any) {
        print("logado: \(self.isLogado)")
    }
    
    /*
     RECEBER INFOS DO USUARIO
     
     if let user = user {
       // The user's ID, unique to the Firebase project.
       // Do NOT use this value to authenticate with your backend server,
       // if you have one. Use getTokenWithCompletion:completion: instead.
       let uid = user.uid
       let email = user.email
       let photoURL = user.photoURL
       // ...
     }
     */
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

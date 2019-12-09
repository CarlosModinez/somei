//
//  PrincipalViewController.swift
//  Somei
//
//  Created by José Guilherme Bestel on 29/11/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit
import FirebaseUI
import Alamofire

class PrincipalViewController: UIViewController {
    
    var handle :AuthStateDidChangeListenerHandle!
    @IBOutlet var emailLogin: UITextField!
    @IBOutlet var senhaLogin: UITextField!
    
    var isLogado :Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        criarUsuario(email: "josegbestel@gmail.com", password: "Abc@12345")
//        loginUsuario(email: "josegbestel@gmail.com", password: "Abc@12345")
//        logoutUsiario()
//        dadosCnpj()
        
       // getlatLon()
        
        

        // Do any additional setup after loading the view.
    }
    
    //Detecta o estado de autenticação
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            print("estado login: \(user?.email ?? nil)")
            print("Email usuario: \(user?.email?.isEmpty)")
            if(user?.email?.isEmpty ?? true){
                print("sem usuario")
            }else{
                self.isLogado = true
            }
            
        }
        
//        var avaliacoes : [Avaliacao] = []
//        avaliacoes.append(Avaliacao(nota: 10, comentario: "bom"))
//        avaliacoes.append(Avaliacao(nota: 3, comentario: "ok"))
//        avaliacoes.append(Avaliacao(nota: 4, comentario: "legal"))
//        
//    
//        let endereco = Endereco(cep: 34235235, numero: 3423, logradouro: "Rua vitoria bassil", bairro: "Morada do vale", cidade: "Taubate", estado: "SP")
//        let empresa = Empresa(cnpj: "o3842938", nomeFantasia: "Bello Quarto", endereco: endereco, avaliacoes: avaliacoes, categoria: "eletricista", telefone: "3243-2342", email: "noidef.djhfs@alunos.edu.br", descricao: "descricao")
//        let user = Usuario(cadastroPessoaFisicaOuJuridica: "893294872", dtNascimento: "03-10-1998", nome: "CARLOS", email: "noidef.djhfs@alunos.edu.br", telefone: "", empresa: empresa)
               
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
    
    func logoutUsiario(){
        do{
            try Auth.auth().signOut()
        }catch _ {
            print("Erro no login")
        }
    }
    
    @IBAction func logar(_ sender: Any) {
        print("logar")
        if !emailLogin.text!.isEmpty && !senhaLogin.text!.isEmpty{
            print("campos ok")
            loginUsuario(email: emailLogin.text!, password: senhaLogin.text!)
        }else{
            print("Campos de login vazios")
        }
    }
    @IBAction func verificarLogin(_ sender: Any) {
        print("verificar login")
        print("logado: \(self.isLogado)")
    }
    
    func dadosCnpj(){
        print("\n\n\n")
        let url = URL(string: "https://www.receitaws.com.br/v1/cnpj/29783738000154")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let data = data else { return }
        print(String(data: data, encoding: .utf8)!)
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Dictionary<String, AnyObject>
               
                //let email = json!["email"] as? String
                
                let fantasia = json!["fantasia"] as? String
                let telefone = json!["telefone"] as? String
                let logradouro = json!["logradouro"] as? String
                let numero = json!["numero"] as? String
                let bairro = json!["bairro"] as? String
                let municipio = json!["municipio"] as? String
                let uf = json!["uf"] as? String
                let cep = json!["cep"] as? String
                
                let situacao = json!["situacao"] as? String //Validar se é Ativa
                let status = json!["status"] as? String //Validar se é OK
                let natureza_juridica = json!["natureza_juridica"] as? String //Validar se é MEI
                
                if(situacao == "ATIVA" && status == "OK" && natureza_juridica == "213-5 - Empresário (Individual)"){
                    //Criar empresa
                }else{
                    
                }
            }catch _{
                
            }
            
        }
        
        task.resume()
        print("pos resumo")
    }
    
    func getlatLon(){
        
        let numero = 2245
        let logradouro = "Estrada Guilherme Weigert"
        let cidade = "Curitiba"
        
        let enderecoCompleto = "\(numero)+\(logradouro),+\(cidade)".replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        
        print(enderecoCompleto)
        
        let url = URL(string: "https://nominatim.openstreetmap.org/search?q=\(enderecoCompleto),+Brazil&format=json&addressdetails=0")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            
            print(String(data: data, encoding: .utf8)!)
            print("\n\n\n")

            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [Dictionary<String, AnyObject>]
                
               // let dados = json["0"]!

                let lon = json?[0]["lon"] as? String
                let lat = json?[0]["lat"] as? String

                print("self.latitude = \(Double(lat ?? "0")!)")
                print("self.longitude = \(Double(lon ?? "0")!)")
            }catch _{
                
            }

        }

        task.resume()
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

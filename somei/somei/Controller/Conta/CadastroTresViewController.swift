//
//  CadastroTresViewController.swift
//  Somei
//
//  Created by José Guilherme Bestel on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit
import FirebaseUI
import Alamofire

class CadastroTresViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var descricaoAtividade: UITextField!
    @IBOutlet var encontrarClienteView: UIView!
    @IBOutlet var descAtivLabel: UILabel!
    @IBOutlet var descAtivInput: UITextField!
    @IBOutlet var descricao: UILabel!
    @IBOutlet var checkImg: UIImageView!
    
    var user :Usuario = Usuario()
    var senhaUser :String = ""
    var acharClientes :Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(user.cadastroPessoaFisicaOuJuridica.count > 11){
            print("é um cnpj")
            //Habilitar opção de encontrar um cliente
            self.acharClientes = true
            self.encontrarClienteView.isHidden = false
            self.descAtivLabel.isHidden = false
            self.descAtivInput.isHidden = false
            self.descricao.isHidden = false
            self.checkImg.isHidden = false
        }else{
            //Desabilitar opção de encontrar um cliente
            self.acharClientes = false
            self.encontrarClienteView.isHidden = true
            self.descAtivLabel.isHidden = true
            self.descAtivInput.isHidden = true
            self.descricao.isHidden = true
            self.checkImg.isHidden = true
            
            self.criarUsuario(email: user.email, password: self.senhaUser)
            DAOFireBAseUsuario.saveUser(user)
            
            //Retornar para a tela de login
            self.navigationController?.popToViewController((self.navigationController?.viewControllers[0])!, animated: true)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches as! Set<UITouch>, with: event)
        view.endEditing(true)
    }
    
    @IBAction func concluir(_ sender: Any) {
        
        self.criarUsuario(email: user.email, password: self.senhaUser)
        DAOFireBAseUsuario.saveUser(user)
        
        //Retornar para a tela de login
        self.navigationController?.popToViewController((self.navigationController?.viewControllers[0])!, animated: true)
    }
    
    //Criar novo usuario
    func criarUsuario(email :String, password :String){
        print("criar usuario: \(email)-\(password)")
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil{
                print("Erro ao cadastrar usuario para autenticação")
                print(error)
            }else{
                print("usuario \(authResult?.user.email ?? "NONE") criado")
                print("achar cliente: \(self.acharClientes)")
                if(self.acharClientes){
                    //Salvar empresa
                    self.criarEmpresa()
                }
            }
        }
    }
    
    @IBAction func encontrarCliente(_ sender: Any) {
        print("clicou encontrar cliente")
        if(self.acharClientes){
            //Habilitar opção de encontrar um cliente
            self.descAtivLabel.isHidden = true
            self.descAtivInput.isHidden = true
            self.acharClientes = true
            self.checkImg.isHidden = true
            self.acharClientes = false
        }else{
            //Desabilitar opção de encontrar um cliente
            self.descAtivLabel.isHidden = false
            self.descAtivInput.isHidden = false
            self.acharClientes = false
            self.checkImg.isHidden = false
            self.acharClientes = true
        }
        print("achar clientes agora: \(self.acharClientes)")
    }
    
    @IBAction func buscarFoto(_ sender: Any) {
        print("clicou em buscar foto")
    }
    
    func criarEmpresa(){
        print("\n\n\n")
        let url = URL(string: "https://www.receitaws.com.br/v1/cnpj/\(user.cadastroPessoaFisicaOuJuridica)")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let data = data else { return }
            print("\n\n\n")
            print(String(data: data, encoding: .utf8)!)
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Dictionary<String, AnyObject>
                
                let fantasia = json!["fantasia"] as? String ?? "none"
                let telefone = json!["telefone"] as? String ?? "none"
                let logradouro = json!["logradouro"] as? String ?? "none"
                let numero = json!["numero"] as? String ?? "0"
                let bairro = json!["bairro"] as? String ?? "none"
                let municipio = json!["municipio"] as? String ?? "none"
                let uf = json!["uf"] as? String ?? "none"
                var cep = json!["cep"] as? String ?? "0"
                cep = cep.replacingOccurrences(of: ".", with: "", options: .literal, range: nil)
                cep = cep.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)

                let atv_principal = json!["atividade_principal"] as? [Dictionary<String, AnyObject>]
                var cod = atv_principal![0]["code"] as? String
                cod = cod?.replacingOccurrences(of: ".", with: "", options: .literal, range: nil)
                cod = cod?.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
                
                let situacao = json!["situacao"] as? String ?? "none" //Validar se é Ativa
                let status = json!["status"] as? String ?? "none" //Validar se é OK
//                let natureza_juridica = json!["natureza_juridica"] as? String ?? "none"//Validar se é MEI
                let natureza_juridica = "213-5 - Empresário (Individual)"
                
                print("\(situacao) - \(status) - \(natureza_juridica)")
                print("cod categoria: \(cod ?? "code none")")
                
                if(situacao == "ATIVA" && status == "OK" && natureza_juridica == "213-5 - Empresário (Individual)"){
                    //Criar empresa
                    let _ = DAOFireBaseCategorias.buscarTraducaoMEI(codigo: cod!) { (categoria) in
                        print("categoria trad: \(categoria ?? "categoria n localizada")")
                        print("\n\n\n")
                        let cnpj = self.user.cadastroPessoaFisicaOuJuridica
                        let nomeFantasia = fantasia
                        print("\n")
                        let cep = Int(cep)
                        let num = Int(numero)
                        let endereco = Endereco(cep: cep!, numero: num!, logradouro: logradouro, bairro: bairro, cidade: municipio, estado: uf)
                        let emp = Empresa(cnpj: cnpj, nomeFantasia: nomeFantasia, endereco: endereco, avaliacoes: [], categoria: categoria!, telefone: telefone, email: self.user.email, descricao: self.descricaoAtividade.text!)
                        DAOFireBaseEMpresas.saveEmpresa(emp)
                    }
                }else{
                    
                }
            }catch _{
                
            }
            
        }
        
        task.resume()
        print("pos resumo")
    }
}

//
//  MinhaContaViewController.swift
//  Somei
//
//  Created by Cristiano Correia on 09/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit
import FirebaseUI
import Alamofire

class MinhaContaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var empresa : Empresa!
    var usuario : Usuario!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        usuario = Model.instance.usuario
        
        
            if usuario == nil {
                tabBarController?.selectedIndex = 0
                let vc = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginViewController"))
              // self.show(vc, sender: self)
               self.present(vc, animated: true, completion: nil)
                return
            }
        empresa = Model.instance.usuario.empresa

        
        tableView.tableFooterView = UIView()
        
        if let nome = usuario.nome.components(separatedBy: " ").first {
            lblNome.text = nome
        }
        else {
            lblNome.text = usuario.nome
        }
        //print("NOME = ", usuario.nome.)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("index path = ", indexPath.row)
        
        if indexPath.row == 0 {
            tableView.estimatedRowHeight = 44.0
            tableView.rowHeight = UITableView.automaticDimension
            
            let cell0 = tableView.dequeueReusableCell(withIdentifier: "NomeMinhaContaTableViewCell", for: indexPath) as! NomeMinhaContaTableViewCell
            
            
            if empresa != nil{
                
                cell0.lblNome.text = empresa.nomeFantasia
                cell0.lblEmail.text = empresa.email
                cell0.lblTelefone.text = empresa.telefone
                
            } else{
                
                cell0.lblNome.text = usuario.nome
                cell0.lblEmail.text = usuario.email
                cell0.lblTelefone.text = usuario.telefone

            }
            
            return cell0
            
        } else if indexPath.row == 1 {
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "DescricaoMinhaContaTableViewCell", for: indexPath) as! DescricaoMinhaContaTableViewCell
            
            if empresa != nil{
                tableView.estimatedRowHeight = 44.0
                tableView.rowHeight = UITableView.automaticDimension
                
                cell1.textViewDescricao.text = empresa.descricao
                
            } else {
                
                cell1.textViewDescricao.text = ""
                cell1.frame.size = CGSize(width: cell1.frame.width, height: 1)
                tableView.rowHeight = 1.0
                
            }
            return cell1
            
        }else if indexPath.row == 2 {
            tableView.rowHeight = 80
            print("vai criar a terceira")
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "AjudaBotaoTableViewCell", for: indexPath) as! AjudaBotaoTableViewCell

            cell1.botaoAjuda.addTarget(self, action: #selector(irParaAjuda), for: .touchUpInside)

            return cell1
        }
        else {
            tableView.rowHeight = 80
            print("vai criar a quarta")
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "LogoutBotaoTableViewCell", for: indexPath) as! LogoutBotaoTableViewCell

            cell1.botaoLogout.addTarget(self, action: #selector(logout), for: .touchUpInside)

            return cell1
        }
            
    }
    
    @objc func irParaAjuda(){
        
        let controller = UIStoryboard(name: "Ajuda", bundle: nil).instantiateViewController(withIdentifier: "AjudaViewController") as! AjudaViewController
        
        self.present(controller, animated: true, completion: nil)
        
    }
    
    @objc func logout(){
       do{
           try Auth.auth().signOut()
       }catch _ {
           
       }
        let vc = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "inicioViewController"))
    navigationController?.setViewControllers([vc], animated: true)
        
   }
    
    
}
    
    

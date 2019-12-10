//
//  MinhaContaViewController.swift
//  Somei
//
//  Created by Cristiano Correia on 09/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class MinhaContaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var empresa : Empresa!
    var usuario : Usuario!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
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
                
                cell1.textViewDescricao.text = empresa.descricao
                
            } else {
                
                cell1.textViewDescricao.text = ""
                tableView.rowHeight = 0.0
                
            }
            
        }
                
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "AjudaBotaoTableViewCell", for: indexPath) as! AjudaBotaoTableViewCell
            
            cell1.botaoAjuda.addTarget(self, action: #selector(irParaAjuda), for: .touchUpInside)
        
        
                return cell1
    
            
        }
    
    @objc func irParaAjuda(){
        
        let controller = AjudaViewController()
        
        self.present(controller, animated: true, completion: nil)
        
    }
    
    
}
    
    

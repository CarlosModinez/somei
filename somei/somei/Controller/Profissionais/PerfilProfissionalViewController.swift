//
//  PerfilProfissionalViewController.swift
//  Somei
//
//  Created by Cristiano Correia on 02/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class PerfilProfissionalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    //propriedades tableview comentários
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell0 = tableView.dequeueReusableCell(withIdentifier: "NomeProfissional", for: indexPath) as! NomeProfissionalTableViewCell
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "DescricaoProfissional", for: indexPath) as! DescricaoProfissionalTableViewCell
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "BotaoContato", for: indexPath) as! BotaoContatoTableViewCell
        
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "AvaliacaoProfissional", for: indexPath) as! AvaliacaoProfissionalTableViewCell
        
        let cell4 = tableView.dequeueReusableCell(withIdentifier: "Comentario", for: indexPath) as! ComentarioTableViewCell

        if indexPath.row == 0{
            
//            cell0.lblNomeProfissional =
//            cell0.imgProfissional =
//            cell0.imgAvaliacao =
            
            return cell0
        } else if indexPath.row == 1{
            
//            cell1.txtDescricaoProfissional =

            return cell1
        } else if indexPath.row == 2{
            
//            cell2.ligarButton.titleLabel =
//            cell2.mensagemButton.titleLabel =
            
            
            return cell2
        } else if indexPath.row == 3{
            
            
            return cell3
        } else{
            
//            cell4.imgAvaliacao =
//            cell4.txtComentario =
            
        }
        
        return cell4
        
    }

}

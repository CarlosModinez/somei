//
//  ListaProfissionaisPesquisaViewController.swift
//  Somei
//
//  Created by Cristiano Correia on 02/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class ListaProfissionaisPesquisaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        return 5
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListaProfissionais", for: indexPath) as! ListaProfissionaisTableViewCell
        
        return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PerfilProfissionalViewController") as? PerfilProfissionalViewController{
            view.reloadInputViews()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

//
//  PerfilProfissionalViewController.swift
//  Somei
//
//  Created by Cristiano Correia on 02/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class PerfilProfissionalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var imgProfissional: UIImageView!
    @IBOutlet var lblNomeProfissional: UILabel!
    @IBOutlet var txtDescricaoProfissional: UITextView!
    @IBOutlet var tableViewAtividades: UITableView!
    @IBOutlet var entrarEmContatoButton: UIButton!
    @IBOutlet var favoritarProfissionalButton: UIButton!
    @IBOutlet var viewFavoritarProfissional: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableViewAtividades.delegate = self
        tableViewAtividades.dataSource = self
        
    }
    
    //sombra na view
    func sombreiaView (v : UIView!, blur : CGFloat, y: CGFloat, opacidade : Float) {
        
    v.layer.shadowOffset = CGSize(width: 0, height: y)
    v.layer.shadowRadius = blur
    v.layer.shadowColor = UIColor.lightGray.cgColor
    v.layer.shadowOpacity = opacidade
        
    }
    
//    atualizar a view por aqui
//    TODO: chamar imagem, nome do profissional, descrição e classificação
    func atualizarInterface(){
        
        sombreiaView(v: viewFavoritarProfissional, blur: 7, y: 2, opacidade: 0.6)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DescricaoAtividade", for: indexPath) as! ListaAtividadesTableViewCell
        
        return cell
    }
    
    
//    função entrar em contato
    @IBAction func entrarEmContato(_ sender: Any) {
        
        
        
    }
    
    
    
}

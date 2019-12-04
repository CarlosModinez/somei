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
    @IBOutlet var ligarParaButton: UIButton!
    @IBOutlet var conversarWhatsAppButton: UIButton!
    @IBOutlet var favoritarProfissionalButton: UIButton!
    @IBOutlet var viewFavoritarProfissional: UIView!
    @IBOutlet var escreverAvaliacaoButton: UIButton!
    @IBOutlet weak var tableViewComentarios: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableViewComentarios.dataSource = self
        tableViewComentarios.delegate = self
        
    }
    
    //sombra na view
    func sombreiaView (v : UIView!, blur : CGFloat, y: CGFloat, opacidade : Float) {
        
    v.layer.shadowOffset = CGSize(width: 0, height: y)
    v.layer.shadowRadius = blur
    v.layer.shadowColor = UIColor.lightGray.cgColor
    v.layer.shadowOpacity = opacidade
        
    }
    
//    ---- atualizar a view por aqui ----
//    TODO: chamar imagem, nome do profissional, descrição e classificação
    func atualizarInterface(){
        
//        lblNomeProfissional =
//        imgProfissional =
//        txtDescricaoProfissional =
            
        sombreiaView(v: viewFavoritarProfissional, blur: 7, y: 2, opacidade: 0.6)
        
    }
    
    
    //propriedades tableview comentários
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Comentario", for: indexPath) as! ComentarioTableViewCell

//        ---- nome de quem comentou -----
//        cell.lblNomeComentario =

//        ---- comentario deixado -----
//        cell.txtComentario =
        
        return cell
    }

//  ---- função entrar em contato por ligação ----
    @IBAction func ligarButton(_ sender: Any) {
        
        
    }
//  ---- função entrar em contato por WhatsApp ----
    @IBAction func conversarButton(_ sender: Any) {
        
        
    }
//  ---- função escrever avaliação/comentário no perfil do profissional ----
    @IBAction func avaliacaoButton(_ sender: Any) {
        
        
    }
    
    
}

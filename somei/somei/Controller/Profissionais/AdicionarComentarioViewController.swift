//
//  AdicionarComentarioViewController.swift
//  Somei
//
//  Created by Cristiano Correia on 04/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class AdicionarComentarioViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var adicionarComentario: UITextField!
    @IBOutlet var avaliarButton: UIButton!
    @IBOutlet var avaliacaoLista: Array <UIButton>?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        adicionarComentario.delegate = self

    }
    
//    apertar return e fechar teclado
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        adicionarComentario.resignFirstResponder()
        print("return pressed")
        
        return true
    }
    
    
//  receber de botaoLista e contar a tag que foi recebida e direcionar pra regra de 3 das avaliações
    @IBAction func avaliarEstrelas(_ sender: Any) {
        
 
        
    }
    
    
//  onde usuario da o input do comentario
    @IBAction func inputComentario(_ sender: Any) {
        
        
    }
    
//    dar send na avaliação e chamar a view anterior
    @IBAction func finalizarAvaliacao(_ sender: Any) {
        
        vibrate()
        
//        let controller = PerfilProfissionalViewController()
//        self.present(controller, animated: true, completion: nil)
        
    }
    
    func vibrate(){
       
        let generator = UIImpactFeedbackGenerator()
        generator.impactOccurred()

    }
    
    //chamar tela de ajuda
    @IBAction func direcionarAjudaButton(_ sender: Any) {
        
        
        
    }
    
    
}

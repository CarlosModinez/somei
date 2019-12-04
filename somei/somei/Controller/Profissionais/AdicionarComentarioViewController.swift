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
    
//    apertar em qualquer lugar e fechar teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        return true
    }
    
    
//    onde usuario da o input do comentario
    @IBAction func inputComentario(_ sender: Any) {
        
        
    }
    
//    dar send na avaliação
    @IBAction func finalizarAvaliacao(_ sender: Any) {
        
        
    }
    
}

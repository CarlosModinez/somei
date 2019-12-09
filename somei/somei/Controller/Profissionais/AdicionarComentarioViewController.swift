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
    
    var avaliacao : Avaliacao!
    var avaliacoes : [Avaliacao] = []
    
    var empresa : Empresa!
    
    var notaInicial : Int!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        adicionarComentario.delegate = self
        
        for i in 0...4 {
            if i <= notaInicial {
                avaliacaoLista?[i].setImage(#imageLiteral(resourceName: "star-gray"), for: .normal)
            }
            else {
                avaliacaoLista?[i].setImage(#imageLiteral(resourceName: "star-line"), for: .normal)
            }
        }
        
    }
    
    //    apertar return e fechar teclado
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        adicionarComentario.resignFirstResponder()
        print("return pressed")
        
        return true
    }
    
    
    //  receber de botaoLista e contar a tag que foi recebida e direcionar pra regra de 3 das avaliações
    @IBAction func avaliarEstrelas(_ sender: UIButton){
        
        for i in 0...4 {
            if i <= sender.tag {
                //                botoesEstrela[i]?.imageView?.image = #imageLiteral(resourceName: "star-gray")
                avaliacaoLista?[i].setImage(#imageLiteral(resourceName: "star-gray"), for: .normal)
            }
            else {
                //                botoesEstrela[i]?.imageView?.image = #imageLiteral(resourceName: "star-line")
                avaliacaoLista?[i].setImage(#imageLiteral(resourceName: "star-line"), for: .normal)
            }
        }
        
        empresa.avaliacoes.append(Avaliacao(nota: sender.tag + 1, comentario: "") )
        
        vibrate()
        
    }
    
    
    //  onde usuario da o input do comentario
    @IBAction func inputComentario(_ sender: Any) {
        
        let texto = (sender as! UITextField).text
        
        empresa.avaliacoes.append(Avaliacao(nota: notaInicial, comentario: "\(texto)") )
        
        print(avaliacoes.debugDescription)
        
    }
    
    //    dar send na avaliação e chamar a view anterior
    @IBAction func finalizarAvaliacao(_ sender: Any) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PerfilProfissionalViewController") as? PerfilProfissionalViewController {
                  self.navigationController?.pushViewController(vc, animated: true)
            vc.reloadInputViews()
            
              }
        
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

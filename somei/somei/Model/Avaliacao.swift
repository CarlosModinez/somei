//
//  Avaliacao.swift
//  somei
//
//  Created by Cristiano Correia on 28/11/19.
//  Copyright © 2019 Cristiano Correia. All rights reserved.
//

import Foundation

class Avaliacao {
    
    var nota : Int
    var comentario : String
    
    init (nota: Int, comentario: String){
        
        self.nota = nota
        self.comentario = comentario
    }
    
    
    static func mapToObject(dct : [String : Any]) -> Avaliacao {
        let nota : Int = dct["nota"] as! Int
        let comentario : String = dct["comentario"] as! String
        
        let avaliacao =  Avaliacao(nota: nota, comentario: comentario)
        return avaliacao
    }
}

//
//  Categoria.swift
//  Somei
//
//  Created by Carlos Modinez on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import Foundation


class Categoria {
    
    var codigo: String
    var nomeOficial: String
    var traducao: String
    
    init(codigo: String, nomeOficial: String, traducao: String) {
        self.codigo = codigo
        self.nomeOficial = nomeOficial
        self.traducao = traducao
    }
    
    static func mapToObject(dct: [String: Any]) -> Categoria {
        
        let codigo : String = dct["codigo"] as! String
        let nomeOficial : String = dct["nomeOficial"] as! String
        let traducao : String = dct["traducao"] as! String
        
        let categoria = Categoria(codigo: codigo, nomeOficial: nomeOficial, traducao: traducao)
        
        return categoria
    }
}

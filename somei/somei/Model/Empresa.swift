//
//  Empresa.swift
//  somei
//
//  Created by Cristiano Correia on 28/11/19.
//  Copyright © 2019 Cristiano Correia. All rights reserved.
//

import Foundation

class Empresa {
    
    var cnpj : String
    var nomeFantasia: String
    var telefone: String
    var endereco : Endereco
    var avaliacoes : [Avaliacao]
    var categoria : String
    var email : String
    
    init (cnpj: String, nomeFantasia: String, endereco: Endereco, avaliacoes: [Avaliacao], categoria: String, telefone: String, email: String){
     
        self.cnpj = cnpj
        self.nomeFantasia = nomeFantasia
        self.telefone = telefone
        self.endereco = endereco
        self.avaliacoes = avaliacoes
        self.categoria = categoria
        self.email = email
    }
    
    func avaliar(numNota: Int) {
        
        
        
    }
    
}

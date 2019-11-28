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
    var endereco : String
    var avaliacoes : [Avaliacao]
    var categoria : String
    var telefone : String
    var email : String
    
    init (cnpj: String, nomeFantasia: String, endereco: String, avaliacoes: [Avaliacao], categoria: String, telefone: String, email: String){
     
        self.cnpj = cnpj
        self.nomeFantasia = nomeFantasia
        self.endereco = endereco
        self.avaliacoes = [Avaliacao]
        self.categoria = categoria
        self.telefone = telefone
        self.email = email
    }
    
}

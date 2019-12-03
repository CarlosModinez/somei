//
//  InfoUsuario.swift
//  somei
//
//  Created by Cristiano Correia on 28/11/19.
//  Copyright © 2019 Cristiano Correia. All rights reserved.
//

import Foundation

class Usuario {
    
    var cpf : String
    var dtNascimento : String
    var nome : String
    var email : String
    var cnpj : String
    var empresa : Empresa?
    
    init (cpf: String, dtNascimento: String, nome: String, email: String, cnpj: String, empresa: Empresa?){
        
        self.cpf = cpf
        self.dtNascimento = dtNascimento
        self.nome = nome
        self.email = email
        self.cnpj = cnpj
        self.empresa = empresa
    }
    
    func login(){
        
        
        
    }
    
    func fecharNegocio(cnpj: String){
        
        
        
    }
    
}

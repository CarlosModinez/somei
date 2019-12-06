//
//  InfoUsuario.swift
//  somei
//
//  Created by Cristiano Correia on 28/11/19.
//  Copyright © 2019 Cristiano Correia. All rights reserved.
//

import Foundation

class Usuario {
    
    var cadastroPessoaFisicaOuJuridica: String
    var dtNascimento : String
    var nome : String
    var email : String
    var telefone : String
    var empresa : Empresa?
    
    init(){
        
        self.cadastroPessoaFisicaOuJuridica = ""
        self.dtNascimento = ""
        self.nome = ""
        self.email = ""
        self.telefone = ""
        self.empresa = nil
    }
    
    init (cadastroPessoaFisicaOuJuridica: String, dtNascimento: String, nome: String, email: String, telefone: String, empresa: Empresa?){
        
        self.cadastroPessoaFisicaOuJuridica = cadastroPessoaFisicaOuJuridica
        self.dtNascimento = dtNascimento
        self.nome = nome
        self.email = email
        self.telefone = telefone
        self.empresa = empresa
    }
    
    func mapToObject(userData: [String: Any]) -> Usuario {
        
        let cadastroPessoaFisicaOuJuridica: String = userData["cadastroPessoaFisicaOuJuridica"]as! String
        let dtNascimento : String = userData["dtNascimento"] as! String
        let nome : String =  userData["nome"] as! String
        let email : String = userData["email"] as! String
        let telefone :String = userData["telefone"] as! String
        
        let usuario = Usuario(cadastroPessoaFisicaOuJuridica: cadastroPessoaFisicaOuJuridica, dtNascimento: dtNascimento, nome: nome, email: email, telefone: telefone, empresa: nil)
        
        return usuario
    }
    
    
    func login(){
    }
    
    func fecharNegocio(cnpj: String){
    }
    
    
    func mapToDictionary() -> [String :Any]{
        
        let localData :[String:Any] = [
            "cadastroPessoaFisicaOuJuridica": self.cadastroPessoaFisicaOuJuridica,
            "dtNascimento": self.dtNascimento,
            "nome": self.nome,
            "email": self.email,
            "telefone": self.telefone
        ]
            
        return localData
    }
    
    static func mapToObject(userData: [String: Any]) -> Usuario {
        
        let cadastroPessoaFisicaOuJuridica: String = userData["cadastroPessoaFisicaOuJuridica"]as! String
        let dtNascimento : String = userData["dtNascimento"] as! String
        let nome : String =  userData["nome"] as! String
        let email : String = userData["email"] as! String
        let telefone :String = userData["telefone"] as! String
        
        let usuario = Usuario(cadastroPessoaFisicaOuJuridica: cadastroPessoaFisicaOuJuridica, dtNascimento: dtNascimento, nome: nome, email: email, telefone: telefone, empresa: nil)
        
        return usuario
    }
    
    
    
}

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
    var descricao : String
    
    init (cnpj: String, nomeFantasia: String, endereco: Endereco, avaliacoes: [Avaliacao], categoria: String, telefone: String, email: String, descricao: String){
     
        self.cnpj = cnpj
        self.nomeFantasia = nomeFantasia
        self.telefone = telefone
        self.endereco = endereco
        self.avaliacoes = avaliacoes
        self.categoria = categoria
        self.email = email
        self.descricao = descricao
    }
    
    func avaliar(numNota: Int) {
    }
    
    func mapToDictionary() -> [String :Any]{
        
        var avaliacoes: [String: Any] = [:]
        var avaliacao: [String : Any] = [:]
        
        for i in 0..<self.avaliacoes.count {
            avaliacao = ["nota" : self.avaliacoes[i].nota,
                         "comentario" : self.avaliacoes[i].comentario]
            
            avaliacoes["\(i)"] = avaliacao
        }
        
        let empresaData :[String:Any] = [
            "cnpj": self.cnpj,
            "nomeFantasia": self.nomeFantasia,
            "telefone": self.telefone,
            "endereco": [
                "cep": self.endereco.cep,
                "numero": self.endereco.numero,
                "latitude": self.endereco.latitude,
                "longitude" : self.endereco.longitude,
                "logradouro": self.endereco.logradouro,
                "bairro": self.endereco.bairro,
                "cidade": self.endereco.cidade,
                "estado": self.endereco.estado
            ],
            
            "avaliacoes": avaliacoes,
            "categoria": self.categoria,
            "email": self.email,
            "descricao": self.descricao
        ]
        
        return empresaData
    }
    
    static func mapToObject(dct : [String :Any]) -> Empresa {


        let cnpj: String = dct["cnpj"] as! String
        let nomeFantasia: String = dct["nomeFantasia"] as! String
        let telefone: String = dct["telefone"] as! String

        let endereco : Endereco =  Endereco.mapToObect(dct: dct["endereco"] as! [String: Any])

        var avaliacoes : [Avaliacao] = []
        var dctAvaliacoes : [String : Any] = dct["avaliacoes"] as! [String : Any]
        
        for i in 0..<dctAvaliacoes.count {
            var avaliacao : Avaliacao
            avaliacao = Avaliacao.mapToObject(dct: dctAvaliacoes["\(i)"] as! [String : Any])
            
            avaliacoes.append(avaliacao)
        }

        let categoria : String = dct["categoria"] as! String
        let email : String = dct["email"] as! String
        let descricao : String = dct["descricao"] as! String
        
        let empresa = Empresa(cnpj: cnpj, nomeFantasia: nomeFantasia, endereco: endereco, avaliacoes: avaliacoes, categoria: categoria, telefone: telefone, email: email, descricao: descricao)

        return empresa
    }
    
}


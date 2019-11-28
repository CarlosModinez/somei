//
//  Endereco.swift
//  somei
//
//  Created by Cristiano Correia on 28/11/19.
//  Copyright © 2019 Cristiano Correia. All rights reserved.
//

import Foundation

class Endereco {
    
    var cep : Int
    var numero : Int
    var latitude : Int
    var longitude : Int
    var logradouro : String
    var bairro : String
    var cidade : String
    var estado : String
    
    init (cep: Int, numero: Int, latitude: Int, longitude: Int, logradouro: String, bairro: String, cidade: String, estado: String){
        
        self.cep = cep
        self.numero = numero
        self.latitude = latitude
        self.longitude = longitude
        self.logradouro = logradouro
        self.bairro = bairro
        self.cidade = cidade
        self.estado = estado
        
    }
    
}

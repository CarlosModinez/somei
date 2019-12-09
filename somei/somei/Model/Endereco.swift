//
//  Endereco.swift
//  somei
//
//  Created by Cristiano Correia on 28/11/19.
//  Copyright © 2019 Cristiano Correia. All rights reserved.
//

import Foundation
import CoreLocation

class Endereco {
    
    var cep : Int
    var numero : Int
    var latitude : Double
    var longitude : Double
    var logradouro : String
    var bairro : String
    var cidade : String
    var estado : String
    
    init (cep: Int, numero: Int, logradouro: String, bairro: String, cidade: String, estado: String){
        
        self.cep = cep
        self.numero = numero
        self.logradouro = logradouro
        self.bairro = bairro
        self.cidade = cidade
        self.estado = estado
        
        self.latitude = 0
        self.longitude = 0
        
        self.getLonLat()
    }
    
    init (cep: Int, numero: Int, logradouro: String, bairro: String, cidade: String, estado: String, lon: Double, lat: Double){
        
        self.cep = cep
        self.numero = numero
        self.logradouro = logradouro
        self.bairro = bairro
        self.cidade = cidade
        self.estado = estado
        self.latitude = lat
        self.longitude = lon
    }
    
    func getLonLat(){
        let loc = MapaController.instance.getlatLon(endereco: self)
        self.longitude = (loc?.coordinate.longitude) ?? 0
        self.latitude = (loc?.coordinate.latitude) ?? 0
    }
    
    static func mapToObect(dct : [String:Any]) -> Endereco {
        let cep : Int = dct["cep"] as! Int
        let numero : Int = dct["numero"] as! Int
//        let latitude : Double = dct["latitude"] as! Double
//        let longitude : Double = dct["longitude"] as! Double
        let logradouro : String = dct["logradouro"] as! String
        let bairro : String = dct["bairro"] as! String
        let cidade : String = dct["cidade"] as! String
        let estado : String = dct["estado"] as! String
        let lat : Double = dct["latitude"] as! Double
        let lon : Double = dct["longitude"] as! Double
    
        let endereco = Endereco(cep: cep, numero: numero, logradouro: logradouro, bairro: bairro, cidade: cidade, estado: estado, lon: lon, lat: lat)
        
        return endereco
    }
    
}

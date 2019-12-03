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
    }
    
    func getLonLat(){
        //get longidute e latitude
        let enderecoCompleto = "\(self.numero)+\(self.logradouro),+\(self.cidade)".map({(c) -> Character in
            return c == " " ? "+": c
        })
        
        print(enderecoCompleto)
        
        let url = URL(string: "https://nominatim.openstreetmap.org/search?q=\(enderecoCompleto),+Brazil&format=json&addressdetails=0")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }

            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [Dictionary<String, AnyObject>]

                let lon = json?[0]["lon"] as? String
                let lat = json?[0]["lat"] as? String

                self.latitude = Double(lat ?? "0")!
                self.longitude = Double(lon ?? "0")!
            }catch _{
            }
        }
        task.resume()
        
    }
    
}

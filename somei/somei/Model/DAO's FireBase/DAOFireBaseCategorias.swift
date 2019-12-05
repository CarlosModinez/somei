//
//  DAOFireBaseCategorias.swift
//  Somei
//
//  Created by Carlos Modinez on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import Foundation
import Firebase

class DAOFireBaseCategorias {
    
    static func buscarTraducaoMEI(_ nomeOficial: String) {
           
        let db = Firestore.firestore()
        db.collection("codigoMEI").getDocuments { (querySnapshot, err) in
            if let err =  err {
                print("Error: \(err)")
            } else {
                
                TodasAsEmpresas.shared.empresas.removeAll()
                   
                for document in querySnapshot!.documents {
                       
                    let empresa = Empresa.mapToObject(dct: document.data())
                       
                    TodasAsEmpresas.shared.empresas.append(empresa)
                }
            }
        }
    }
    
    static func salvarTablelaMEI () {
        let db = Firestore.firestore()
        
        var tabelaRef: DocumentReference? = nil
        
        var tabelaData: [String : Any] = [
            "ABATEDOR(A) DE AVES COM COMERCIALIZAÇÃO DO PRODUTO INDEPENDENTE 4724-500" : "Abatedor de aves"
        
        ]
        
        tabelaRef = db.collection("codigoMEI").addDocument(data: tabelaData) { err in
            if let err = err {
                print("Error: \(err)")
            } else {
                
            }
        }
    }
    
    
    
    
    
    
    
    
    
}

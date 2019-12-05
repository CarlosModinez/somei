//
//  DAOFireBaseEmpresas.swift
//  Somei
//
//  Created by Carlos Modinez on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import Foundation
import Firebase

class DAOFireBaseEMpresas {
    
    
    
    // Carreca as empresas das categorias que voce selecionou
    static func loadEmpresa(_ categoria: String) {
           
        let db = Firestore.firestore()
           
        db.collection("empresas").whereField("categoria", isEqualTo: categoria).getDocuments() { (querySnapshot, err) in
            if let err =  err {
                print("Error: \(err)")
            } else {
                
                TodasAsEmpresasDaCategoria.shared.empresas.removeAll()
                   
                for document in querySnapshot!.documents {
                    let empresa = Empresa.mapToObject(dct: document.data())
                    TodasAsEmpresasDaCategoria.shared.empresas.append(empresa)
                
                }
            }
        }
    }
    
    static func saveEmpresa(_ empresa: Empresa) {
        let db = Firestore.firestore()
        
        var empresaRef: DocumentReference? = nil
        var empresaData: [String : Any] = [:]
        
        empresaData = empresa.mapToDictionary()
        empresaRef = db.collection("empresas").addDocument(data: empresaData) { err in
            if let err = err {
                print("Error: \(err)")
            } else {
                print(empresaRef!.documentID)
            }
        }
    }
    
}

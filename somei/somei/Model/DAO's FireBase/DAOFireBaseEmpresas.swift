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
    static func loadEmpresas(_ categoria: String, completion: @escaping (([Empresa]?) -> ())) -> [Empresa]? {
           
        let db = Firestore.firestore()
        var empresas : [Empresa] = []
        
        db.collection("empresas").whereField("categoria", isEqualTo: categoria).getDocuments() { (querySnapshot, err) in
            if let err =  err {
                print("Error: \(err)")
            } else {
                
                for document in querySnapshot!.documents {
                    let empresa = Empresa.mapToObject(dct: document.data())
                    empresas.append(empresa)
                }
            }
            completion(empresas)
        }
        
        if empresas.count > 0 {
            print("Categoria invalida")
            return empresas
        }
        else {
            return nil
        }
    }
    
    static func buscarEmpresaPeloCnpj(cnpj: String, completion: @escaping ((Empresa?) -> ())) -> Empresa? {
        
        let db = Firestore.firestore()
        var empresa : Empresa? = nil
        
        db.collection("empresas").whereField("cnpj", isEqualTo: cnpj).getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error \(err)")
            } else {
                for document in querySnapshot!.documents {
                    empresa = Empresa.mapToObject(dct: document.data())
                }
            }
            completion(empresa)
        }
        
        return empresa
        
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

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
    
    
    //Recebe o codigo e retorna a traducao para o nome oficial
    
    static func buscarTraducaoMEI(codigo: String, completion: @escaping ((String?) -> ())) -> String? {
        let db = Firestore.firestore()
        var traducao: String?
            
        db.collection("codigoMEI").whereField("codigo", isEqualTo: codigo).getDocuments() { (querySnapshot, err) in
            if let err =  err {
                print("Error: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let categoria : Categoria = Categoria.mapToObject(dct: document.data())
                    traducao = categoria.traducao
                }
            }
            
            completion(traducao)
        }
        return traducao
    }

    
    
    // Nao usa essa funcao nao - Funcao usada para salvar as MEIS
    static func salvarTabelaMEI () {
        let db = Firestore.firestore()
        
        var tabelaRef: DocumentReference? = nil
        
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // Apagar
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        var todasAsCategorias: [String: Any] = [:]
        
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // Apagar
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
        
        for i in 0..<todasAsCategorias.count {
            
            tabelaRef = db.collection("codigoMEI").addDocument(data: todasAsCategorias["\(i)"] as! [String : Any]) { err in
                if let err = err {
                    print("Error: \(err)")
                }
            }
        }
            
    }
    
    static func loadCategorias(completion: @escaping (([String]?) -> ())) -> [String]? {
        let semaphore = DispatchSemaphore(value: 0)
           
        let db = Firestore.firestore()
        var categorias : [String] = []
        
        db.collection("codigoMEI").getDocuments() { (querySnapshot, err) in
            if let err =  err {
                print("Error: \(err)")
                semaphore.signal()
            } else {
                
                for document in querySnapshot!.documents {
                    let categoria = document.data()["traducao"] as? String
                    if(!categorias.contains(categoria!)){
                        categorias.append(categoria!)
                    }
                }
            }
            completion(categorias.sorted())
        }
        semaphore.signal()
        return categorias.sorted()
    }
    
}

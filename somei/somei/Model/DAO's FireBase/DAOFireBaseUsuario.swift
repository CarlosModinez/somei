//
//  DAOFireBaseUsuario.swift
//  Somei
//
//  Created by Carlos Modinez on 03/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import Foundation
import Firebase

class DAOFireBAseUsuario {

    
    static func loadUsers() {
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments { (querySnapshot, err) in
            if let err =  err {
                print("Error: \(err)")
            } else {
                
                TodasAsEmpresas.shared.empresas.removeAll()
                
                for document in querySnapshot!.documents {
    
                    let usuario = Usuario.mapToObject(dct: document.data())
                    
                    TodosOsUsuarios.shared.usuarios.append(usuario)
                }
            }
        }
    }
    
    static func saveUser(_ usuario : Usuario) {
        let db = Firestore.firestore()
        
        var userRef: DocumentReference? = nil
        var userData: [String: Any] = [:]
        
        userData = usuario.mapToDictionary()
        userRef = db.collection("users").addDocument(data: userData) { err in
            if let err = err {
                print("Error: \(err)")
            } else {
                print(userRef!.documentID)
            }
        }
        
        if usuario.empresa != nil {
            DAOFireBaseEMpresas.saveEmpresa(usuario.empresa!)
            
        }
    }


}



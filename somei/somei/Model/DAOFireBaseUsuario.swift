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

    
    static func loadEmpresa() {
        
        let db = Firestore.firestore()
        
        db.collection("empresas").getDocuments { (querySnapshot, err) in
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
    
    static func loadUsers() {
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments { (querySnapshot, err) in
            if let err =  err {
                print("Error: \(err)")
            } else {
                
                TodasAsEmpresas.shared.empresas.removeAll()
                
                for document in querySnapshot!.documents {
    
                    let usuario = Usuario.mapToObject(userData: document.data())
                    
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
            saveEmpresa(usuario.empresa!)
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



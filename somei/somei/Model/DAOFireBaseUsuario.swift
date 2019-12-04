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
    
    static func saveUser(_ usuario: Usuario) {
        let db = Firestore.firestore()
        
        var userRef: DocumentReference? = nil
        var empresaRef: DocumentReference? = nil
        var enderecoRef: DocumentReference? = nil
        var avaliacoesRef: DocumentReference? = nil
        
        var userData: [String: Any] = [:]
        var empresaData: [String: Any] = [:]
        var enderecoData: [String: Any] = [:]
        var avaliacoes: [[String: Any]] = [[:]]
        
        
        userData["cadastroPessoaFisicaOuJuridica"] = usuario.cadastroPessoaFisicaOuJuridica
        userData["dtNascimento"] = usuario.dtNascimento
        userData["nome"] = usuario.nome
        userData["email"] = usuario.email
        
        if usuario.empresa != nil {
            
            // Dados gerais da empresa
            empresaData["cnpj"] = usuario.empresa?.cnpj
            empresaData["nomeFantasia"] = usuario.empresa?.nomeFantasia
            empresaData["telefone"] = usuario.empresa?.telefone
            empresaData["categoria"] = usuario.empresa?.categoria
            empresaData["email"] = usuario.empresa?.email
            
            //Endereco da empresa
            enderecoData["cep"] = usuario.empresa?.endereco.cep
            enderecoData["numero"] = usuario.empresa?.endereco.numero
            enderecoData["latitude"] = usuario.empresa?.endereco.latitude
            enderecoData["longitude"] = usuario.empresa?.endereco.longitude
            enderecoData["bairro"] = usuario.empresa?.endereco.bairro
            enderecoData["cidade"] = usuario.empresa?.endereco.cidade
            enderecoData["estado"] = usuario.empresa?.endereco.estado
            
            //Todos os comentarios referentes a empresa
//            for i in 0..<usuario.empresa!.avaliacoes.count {
//                avaliacoes[i]["nota"] = usuario.empresa?.avaliacoes[i].nota
//                avaliacoes[i]["comentario"] = usuario.empresa?.avaliacoes[i].comentario
//            }
        }
        
    
        userRef = db.collection("users").addDocument(data: userData) { err in
            if let err = err {
                print("Error: \(err)")
                
            } else {
                print(userRef!.documentID)
            }
            
            //Caso o usuario tenha uma empresa, ela é adicionada na colecao empresa com ID do usuario. O mesmo acontece com o endereco
            if usuario.empresa != nil {
                empresaRef = db.collection("empresas").addDocument(data: empresaData) { err in
                    if let err = err {
                        print("Error: \(err)")
                    } else {
                        print(empresaRef!.documentID)
                    }
                }
                
                enderecoRef = db.collection("enderecos").addDocument(data: enderecoData) { err in
                    if let err = err {
                        print("Error \(err)")
                    } else {
                        print(enderecoRef!.documentID)
                    }
                }
        
                db.collection("empresas").document(empresaRef!.documentID).setData(["ID": userRef!.documentID], merge: true)
                db.collection("enderecos").document(enderecoRef!.documentID).setData(["ID": userRef!.documentID], merge: true)
            }
        }

        db.collection("users").document(userRef!.documentID).setData([  "ID": userRef!.documentID], merge: true)
    }
    
    static func load() {
        
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments { (querySnapshot, err) in
            if let err =  err {
                print("Error: \(err)")
            } else {
                
                TodasAsEmpresas.shared.usuarios.removeAll()
                
                for document in querySnapshot!.documents {

                    
                }
            }
        }
    }

    
    
}

//
//  TodosOsUsuarios.swift
//  Somei
//
//  Created by Carlos Modinez on 04/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import Foundation

class TodasAsEmpresasDaCategoria {
    static var shared = TodasAsEmpresasDaCategoria()

    
    //usuarios como empresas cadastradas
    var empresas : [Empresa] = []
    
    init(){}
    
}


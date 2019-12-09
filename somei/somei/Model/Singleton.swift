//
//  Singleton.swift
//  Somei
//
//  Created by Carlos Modinez on 09/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import Foundation

class Singleton
{
    static var shared = Singleton()
    
    var usuarios : [Usuario] = []
    var empresas : [Empresa] = []
    var logado : Bool = false
    
    init() {}
}


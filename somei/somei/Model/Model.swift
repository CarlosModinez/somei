//
//  Model.swift
//  Somei
//
//  Created by José Guilherme Bestel on 09/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import Foundation

class Model{
    
    static let instance = Model()
    
    private init(){
        
    }
    
    var isLogado :Bool = false
    var usuario :Usuario!
    
}

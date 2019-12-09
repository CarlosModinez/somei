//
//  Ext_String.swift
//  Somei
//
//  Created by Felipe Mesquita on 06/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    static func negrito (texto : [(frase: String, negrito : Bool)], fontSize : CGFloat) -> NSMutableAttributedString {
        let t : NSMutableAttributedString = NSMutableAttributedString (string: "")
        let firstAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: fontSize)]
        
        for f in texto {
            if f.negrito {
                t.append(NSMutableAttributedString(string: f.frase, attributes: firstAttributes))
            }
            else {
                t.append(NSMutableAttributedString(string: f.frase))
            }
        }
        
        return t
    }
    
}

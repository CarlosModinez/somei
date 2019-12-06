//
//  ViewController.swift
//  Somei
//
//  Created by José Guilherme Bestel on 29/11/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit
import FirebaseUI


class ViewController: UIViewController {
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var actionCodeSettings = ActionCodeSettings()
        actionCodeSettings.url = URL(string: "https://example.appspot.com")
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setAndroidPackageName("com.firebase.example", installIfNotAvailable: false, minimumVersion: "12")
        
       
        
    }
    


}


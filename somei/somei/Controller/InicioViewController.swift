//
//  InicioViewController.swift
//  Somei
//
//  Created by José Guilherme Bestel on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.navigationBar.transparentNavigationBar()
//        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.tobias), name: NSNotification.Name(rawValue: "logou"), object: nil)
    }
    
    @objc func tobias () {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBar") as? UITabBarController {
            
            self.navigationController!.setViewControllers([vc], animated: true)
            
        }
    }
    
    @IBAction func contratar () {
        let vc = (storyboard?.instantiateViewController(withIdentifier: "elfos"))!
        navigationController?.setViewControllers([vc], animated: true)
        
    }
    
    /*
     if let vc = storyboard?.instantiateViewController(withIdentifier: "ListaProfissionaisPesquisaViewController") as? ListaProfissionaisPesquisaViewController {
       
         self.navigationController?.pushViewController(vc, animated: true)
     }
     */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

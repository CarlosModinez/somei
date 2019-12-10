//
//  finalOnboarding.swift
//  Somei
//
//  Created by Felipe Mesquita on 09/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class finalOnboarding: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//    self.navigationController?.navigationBar.transparentNavigationBar()
//        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func passarTela(_ sender: Any) {
        let vc = (storyboard?.instantiateViewController(withIdentifier: "tabBar"))!
        navigationController?.setViewControllers([vc], animated: true)
    }
    
}

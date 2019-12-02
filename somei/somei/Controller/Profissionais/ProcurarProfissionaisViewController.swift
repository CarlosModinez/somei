//
//  ProcurarProfissionaisViewController.swift
//  Somei
//
//  Created by Cristiano Correia on 02/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class ProcurarProfissionaisViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        
        return 5
    }
    
    //TODO: categoria de profissionais
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Profissionais", for: indexPath) as! ProfissionaisMaisProcuradosCollectionViewCell
        
//        cell.lblAreaProfissional = 
        sombreiaView(v: cell.viewCellAreaProfissional, blur: 7, y: 2, opacidade: 0.6)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          if let vc = storyboard?.instantiateViewController(withIdentifier: "ListaProfissionaisPesquisaViewController") as? ListaProfissionaisPesquisaViewController {
            
              self.navigationController?.pushViewController(vc, animated: true)
          }
      }
    
    
    func sombreiaView (v : UIView!, blur : CGFloat, y: CGFloat, opacidade : Float) {
        
    v.layer.shadowOffset = CGSize(width: 0, height: y)
    v.layer.shadowRadius = blur
    v.layer.shadowColor = UIColor.lightGray.cgColor
    v.layer.shadowOpacity = opacidade
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ProcurarProfissionaisViewController.swift
//  Somei
//
//  Created by Cristiano Correia on 02/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class ProcurarProfissionaisViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    
    // MARK: Variáveis
    //Vetor com os elementos da tableView
    let categorias = [
        "Felipe", "Encanador de jogo 2D", "Traficante de drogas ilícitas no mercado internacional", "Jose", "Aquele amigo chato do rolê", "Cristiano", "Restaurador de obras arte", "Animador de festas adultas", "Ana", "Comerciante de bicicletas e triciculos", "Conrado", "Motorista de aplicativo", "Carlinhos",
    ]
    
    // Controller da search bar
    /*
        nil = este viewController
        Se fosse diferente ele exibiria o resultado no vc especificado
     */
    let searchController = UISearchController(searchResultsController: nil)
    
    // Verifica se a search bar está vazia
    var isSearchBarEmpty: Bool {
      return searchBar.text?.isEmpty ?? true
    }
    
    // Está filtrando?
    var isFiltering: Bool {
        return !isSearchBarEmpty
    }
    
    // Vetor de nomes filtrados, que serão exibidos
    var nomesFiltrados: [String] = []
    
    
    // MARK: Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Controller da search bar
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Procurar trampos"
        
        // Coloca na barra
        //navigationItem.searchController = searchController
        searchBar.delegate = self
        //searchBar.barTintColor = .white
        
        //searchController.searchBar.delegate = self
        
        // Modais serão apresentados a partir desta tela
        // Faz com que não fique na tela quando mudar
        // Aparentemente necessário
        definesPresentationContext = true
        
        // Estilo das células da collection
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
          layout.delegate = self
        }
        
        
        // Design da collection
        collectionView?.backgroundColor = .clear
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        for sub in searchBar.subviews {
            for s in sub.subviews {
                for subview in s.subviews {
                    subview.backgroundColor = .white
                }
            }
        }

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("POW", searchBar.text!)
        filterContentForSearchText(searchBar.text!)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return nomesFiltrados.count
        }

        return categorias.count
    }
    
    //TODO: categoria de profissionais
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Profissionais", for: indexPath) as! ProfissionaisMaisProcuradosCollectionViewCell
        
        // Aparência
        //sombreiaView(v: cell.viewCellAreaProfissional, blur: 7, y: 2, opacidade: 0.6)
        cell.layer.cornerRadius = 10
    

        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 1.5
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false

        // Dados
        let nome = (isFiltering ? nomesFiltrados[indexPath.row] : categorias[indexPath.row])
        cell.lblAreaProfissional.text = nome
        
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


// MARK: Search Controller
extension ProcurarProfissionaisViewController: UISearchResultsUpdating {
    
    // Chamado sempre que o valor da search bar muda
    func updateSearchResults(for searchController: UISearchController) {
        //filterContentForSearchText(searchController.searchBar.text!)
    }

    // Filtra os textos do vetor de acordo com o imput do usuário
    func filterContentForSearchText(_ searchText: String) {
        
      nomesFiltrados = categorias.filter { (nome: String) -> Bool in
        return nome.lowercased().contains(searchText.lowercased())
      }
        
        print("Nomes filtrados: ", nomesFiltrados)
        
        // Atualiza a table view
      collectionView.reloadData()
    }
    
    // Esconde o teclado quando toca em OK
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


// MARK: Layout Flow Delegate
extension ProcurarProfissionaisViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
    return CGSize(width: itemSize, height: itemSize)
  }
}

extension ProcurarProfissionaisViewController: PinterestLayoutDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    
    let nome = (isFiltering ? nomesFiltrados[indexPath.row] : categorias[indexPath.row])
    
    let font = UIFont.systemFont(ofSize: 17.0)
    let layout = (collectionView.collectionViewLayout as! PinterestLayout)
    
    let maxSize = CGSize(width: (100), height: CGFloat(MAXFLOAT))
    
    let text = nome as NSString
    
    let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil).height
    
    let lineHeight = font.lineHeight
    
    let resultado = Int(ceil(textHeight / lineHeight) * lineHeight)
    
    return CGFloat(resultado + 50) //photos[indexPath.item].image.size.height
  }
}

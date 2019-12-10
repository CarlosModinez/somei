//
//  ListaProfissionaisPesquisaViewController.swift
//  Somei
//
//  Created by Cristiano Correia on 02/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit
import CoreLocation

class ListaProfissionaisPesquisaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Outlets
    // Table view
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var lbl_titulo: UILabel!
    @IBOutlet var lbl_subtitulo: UILabel!
    
    
    // MARK: Variáveis
    var categoria : String!
    
    var profissionais : [Empresa] = []
    
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    
        // remove as linhas vazias do final da table
        tableView.tableFooterView = UIView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Vou chamar os dados")
        DAOFireBaseEMpresas.loadEmpresas(categoria) { (empresas) in
            print("CARREGOU")
            if self.profissionais.count > 0 {
                self.profissionais.removeAll()
            }
            empresas?.forEach({ (e) in
                print("empresa: \(e)")
                self.profissionais.append(e)
            })
            
            self.profissionais.sort { (a, b) -> Bool in
                let localA = CLLocation(latitude: a.endereco.latitude, longitude: a.endereco.longitude)
                let distA  = MapaController.instance.getDistanciaKm(ate: localA)
                let localB = CLLocation(latitude: b.endereco.latitude, longitude: b.endereco.longitude)
                let distB  = MapaController.instance.getDistanciaKm(ate: localB)
                return distA > distB
            }
            self.tableView.reloadData()
        }
        

        // Texto normal
        // let xString = NSMutableAttributedString(string: "mais próximos:")

        // Texto negrito
        // let xString = NSMutableAttributedString(string: "Profissionais ", attributes: [.font: UIFont.boldSystemFont(ofSize: 20)])

        // Juntar as strings
        // firstString.append(secondString)
        
        lbl_subtitulo.attributedText = String.negrito(texto: [
            (frase: "Profissionais ", negrito: true),
            (frase: "mais próximos de você:", negrito: false)
        ], fontSize: 20)
        
    }
    
    
    // MARK: Funções
    func calculaMedia (p : Empresa) -> Int {
        
        // Previne pra caso não tenha recebido avaliações
        guard p.avaliacoes.count > 0 else {
            return 0
        }
        
        // Calcula a média
        var nota = 0
        for a in p.avaliacoes {
            nota = nota + a.nota
            print("AVALIACAO: ", a.nota)
        }
        
        return nota / p.avaliacoes.count
    }

    
    // MARK: TableView Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        return profissionais.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListaProfissionais", for: indexPath) as! ListaProfissionaisTableViewCell
        
        let prof = profissionais[indexPath.row]
        
        print("# avalizalçoes: ", prof.avaliacoes.count)
        
        let nota = calculaMedia(p: prof)
        let nome = prof.nomeFantasia
        
        // TODO: pegar as coordenadas
        var distancia : String
        
        let local = CLLocation(latitude: prof.endereco.latitude, longitude: prof.endereco.longitude)
        let dist  = MapaController.instance.getDistanciaKm(ate: local)
        if dist != -1 {
            distancia = String(format: "%.1f", dist)
            cell.lblDistanciaProfissional.text = distancia + " km"
        }
        else {
            cell.lblDistanciaProfissional.text = "--"
        }
        
        print("NOTA = \(nota)")
        cell.lblNomeProfissional.text = nome
        cell.imgNotaProfissional?.image = UIImage(named: "star-\(nota)")
    
        return cell
    }
    
    // Toque na célula
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if Model.instance.isLogado{
            
            
            
            if let vc = storyboard?.instantiateViewController(withIdentifier: "PerfilProfissionalViewController") as? PerfilProfissionalViewController{
                view.reloadInputViews()
                vc.empresa = profissionais[indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
        } else{
            
            
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "loginViewController") as? LoginViewController{
            
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "loginViewController") as? LoginViewController{
                
                view.reloadInputViews()
                
                vc.empresa = profissionais[indexPath.row]
                vc.voltarPara = "profissionais"
                
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
        
        
    }

}

}

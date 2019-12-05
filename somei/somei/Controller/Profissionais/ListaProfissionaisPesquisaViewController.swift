//
//  ListaProfissionaisPesquisaViewController.swift
//  Somei
//
//  Created by Cristiano Correia on 02/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit

class ListaProfissionaisPesquisaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Outlets
    // Table view
    @IBOutlet var tableView: UITableView!
    
    
    // MARK: Variáveis
    var categoria : String!
    
    var profissionais : [Empresa]!
    
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // profissionais = BuscaProfissionaisCategoria (categoria)
        profissionais = [
            Empresa(cnpj: "", nomeFantasia: "Nome 1", endereco: Endereco(cep: 12, numero: 12, logradouro: "", bairro: "", cidade: "", estado: ""), avaliacoes: [], categoria: "", telefone: "", email: ""),
            Empresa(cnpj: "", nomeFantasia: "Nome 2", endereco: Endereco(cep: 12, numero: 12, logradouro: "", bairro: "", cidade: "", estado: ""), avaliacoes: [], categoria: "", telefone: "", email: ""),

        ]
        
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
        }
        
        return nota / p.avaliacoes.count
    }

    
    // MARK: TableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        return profissionais.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListaProfissionais", for: indexPath) as! ListaProfissionaisTableViewCell
        
        var nota = calculaMedia(p: profissionais[indexPath.row])
    
        return cell
    }
    
    // Toque na célula
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PerfilProfissionalViewController") as? PerfilProfissionalViewController{
            view.reloadInputViews()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

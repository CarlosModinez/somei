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
    
    @IBOutlet var lbl_titulo: UILabel!
    @IBOutlet var lbl_subtitulo: UILabel!
    
    
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
            Empresa(
                cnpj: "", nomeFantasia: "Felipe de Lima Mesquita",
                endereco: Endereco(cep: 12, numero: 155, logradouro: "Rua Archangelo Smaniotto", bairro: "Jardim das Américas", cidade: "Curitiba", estado: "Paraná"),
                avaliacoes: [
                    Avaliacao(nota: 3, comentario: ""),
                    Avaliacao(nota: 5, comentario: ""),
                    Avaliacao(nota: 5, comentario: ""),
                ],
                categoria: "", telefone: "", email: "", descricao: ""),
            
            Empresa(
            cnpj: "", nomeFantasia: "Nome Carlinhos Boa Vista",
            endereco: Endereco(cep: 12, numero: 12, logradouro: "", bairro: "", cidade: "", estado: ""),
            avaliacoes: [
                Avaliacao(nota: 4, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
            ],
            categoria: "", telefone: "", email: "", descricao: ""),
            
            Empresa(
            cnpj: "", nomeFantasia: "Nome Carlinhos Boa Vista",
            endereco: Endereco(cep: 12, numero: 12, logradouro: "", bairro: "", cidade: "", estado: ""),
            avaliacoes: [
                Avaliacao(nota: 4, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
            ],
            categoria: "", telefone: "", email: "", descricao: ""),
            
            Empresa(
            cnpj: "", nomeFantasia: "Nome Carlinhos Boa Vista",
            endereco: Endereco(cep: 12, numero: 12, logradouro: "", bairro: "", cidade: "", estado: ""),
            avaliacoes: [
                Avaliacao(nota: 4, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
            ],
            categoria: "", telefone: "", email: "", descricao: ""),
            
            Empresa(
            cnpj: "", nomeFantasia: "Nome Carlinhos Boa Vista",
            endereco: Endereco(cep: 12, numero: 12, logradouro: "", bairro: "", cidade: "", estado: ""),
            avaliacoes: [
                Avaliacao(nota: 4, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
            ],
            categoria: "", telefone: "", email: "", descricao: ""),
            
            Empresa(
            cnpj: "", nomeFantasia: "Nome Carlinhos Boa Vista",
            endereco: Endereco(cep: 12, numero: 12, logradouro: "", bairro: "", cidade: "", estado: ""),
            avaliacoes: [
                Avaliacao(nota: 4, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
            ],
            categoria: "", telefone: "", email: "", descricao: ""),
            
            Empresa(
            cnpj: "", nomeFantasia: "Nome Carlinhos Boa Vista",
            endereco: Endereco(cep: 12, numero: 12, logradouro: "", bairro: "", cidade: "", estado: ""),
            avaliacoes: [
                Avaliacao(nota: 4, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
            ],
            categoria: "", telefone: "", email: "", descricao: ""),
            
            Empresa(
            cnpj: "", nomeFantasia: "Nome Carlinhos Boa Vista",
            endereco: Endereco(cep: 12, numero: 12, logradouro: "", bairro: "", cidade: "", estado: ""),
            avaliacoes: [
                Avaliacao(nota: 4, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
            ],
            categoria: "", telefone: "", email: "", descricao: ""),
            
            Empresa(
            cnpj: "", nomeFantasia: "Nome Carlinhos Boa Vista",
            endereco: Endereco(cep: 12, numero: 12, logradouro: "", bairro: "", cidade: "", estado: ""),
            avaliacoes: [
                Avaliacao(nota: 4, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
                Avaliacao(nota: 5, comentario: ""),
            ],
            categoria: "", telefone: "", email: "", descricao: ""),
        ]
        
        
        
        let quote = "Profissionais mais próximos:"

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
        
        let nota = calculaMedia(p: prof)
        let nome = prof.nomeFantasia
        
        // TODO: pegar as coordenadas
        var distancia : String
        

        if let local = MapaController.instance.getlatLon(endereco: prof.endereco) {
            distancia = String(format: "%.1f", MapaController.instance.getDistanciaKm(ate: local))
        }
        else {
            distancia = "--"
        }
        
        cell.lblNomeProfissional.text = nome
        cell.lblDistanciaProfissional.text = distancia + " km"
        cell.imgNotaProfissional?.image = UIImage(named: "star-\(nota)")
    
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

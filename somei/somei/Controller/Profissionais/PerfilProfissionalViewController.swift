//
//  PerfilProfissionalViewController.swift
//  Somei
//
//  Created by Cristiano Correia on 02/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit
import MessageUI

class PerfilProfissionalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMessageComposeViewControllerDelegate {

    @IBOutlet var tableView: UITableView!
    
    var botoesEstrela : [UIButton?] = []
    
//    -----------------APAGAR
    var empresa : Empresa!
//    var avaliacao : Avaliacao!
//    var avaliacoes : [Avaliacao] = []
//    var endereco : Endereco!
//    -----------------APAGAR
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.functionName), name: NSNotification.Name(rawValue: "NotificationID"), object: nil)
        
    }
    
    @objc func functionName() {

        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        self.navigationController?.navigationBar.transparentNavigationBar()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        

        tableView.reloadData()
        
    }


    //propriedades tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        TODO: Apagar a população aqui
//        avaliacao = Avaliacao(nota: 3, comentario: "cuza1")
//        let avaliacao2 = Avaliacao(nota: 2, comentario: "doida1")
//        avaliacoes.append(avaliacao2)
//        avaliacoes.append(avaliacao)
        
        //endereco = Endereco(cep: 82030150, numero: 240, logradouro: "Rua Ferrara", bairro: "São João", cidade: "Curitiba", estado: "Taubatexas")
        //empresa = Empresa(cnpj: "123124", nomeFantasia: "Conrider Da Nike", endereco: endereco, avaliacoes: avaliacoes, categoria: "Chinelero", telefone: "99671-4302", email: "conrider@nike.com", descricao: "alo alo voce sabem quem sou eu")
//      ---------------APAGAR

//        de 0 a 3 é padrão do perfil, depois disso tem que somar o numero de comentários do tipo Avaliações
        return 4 + empresa.avaliacoes.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension

        // chamando a cell4 aqui pra não dar xabu no return lá no final dessa função da tableview
        let cell4 = tableView.dequeueReusableCell(withIdentifier: "Comentario", for: indexPath) as! ComentarioTableViewCell
        
        
        if indexPath.row == 0{
            
        let cell0 = tableView.dequeueReusableCell(withIdentifier: "NomeProfissional", for: indexPath) as! NomeProfissionalTableViewCell
            
//           nome no perfil
            cell0.lblNomeProfissional.text = empresa.nomeFantasia

//            TODO: imagem profissional
//            cell0.imgProfissional.image =
            
//            =========================
//            TODO: media de avaliações
//            =========================
            cell0.imgAvaliacao.image = UIImage(named: "star-\(calculaMedia(p: empresa))")
            
            self.tableView.rowHeight = 90
            
            return cell0
            
        }
            
        
        else if indexPath.row == 1{
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "DescricaoProfissional", for: indexPath) as! DescricaoProfissionalTableViewCell
            
            cell1.txtDescricaoProfissional.text = empresa.descricao
            
            //self.tableView.rowHeight = 165

            return cell1
            
        }
        
        
        else if indexPath.row == 2{
            
             let cell2 = tableView.dequeueReusableCell(withIdentifier: "BotaoContato", for: indexPath) as! BotaoContatoTableViewCell
            
            cell2.mensagemButton.addTarget(self, action: #selector(mandarMensagem), for: .touchUpInside)
            cell2.ligarButton.addTarget(self, action: #selector(ligarParaProfissional), for: .touchUpInside)
            
            self.tableView.rowHeight = 140
            
            
            return cell2
            
        }
        
        
        else if indexPath.row == 3{
            
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "AvaliacaoProfissional", for: indexPath) as! AvaliacaoProfissionalTableViewCell

            self.tableView.rowHeight = 80
            
            //botoesEstrela.removeAll()
            
            botoesEstrela.append(cell3.umaEstrela)
            botoesEstrela.append(cell3.duasEstrela)
            botoesEstrela.append(cell3.tresEstrela)
            botoesEstrela.append(cell3.quatroEstrela)
            botoesEstrela.append(cell3.cincoEstrela)
            
            return cell3
        }
        
        // Células de avaliação
        else {
            cell4.txtComentario.text = empresa.avaliacoes[indexPath.row - 4].comentario
            cell4.imgAvaliacao.image = UIImage(named: "star-\(empresa.avaliacoes[indexPath.row - 4].nota)")
        }

        return cell4
        
    }

    // chama uma função pro botão da tableview para mandar mensagem de texto
    @objc func mandarMensagem(){
        
        if MFMessageComposeViewController.canSendText() {
        let controller = MFMessageComposeViewController()
        controller.messageComposeDelegate = self
        
        //conteudo da mensagem
            controller.body = "Olá, \(empresa.nomeFantasia)! Encontrei seu perfil no app Somei e gostaria de solicitar um orçamento."
        //aqui chama o numero de telefone do model
            controller.recipients = ["\(empresa.telefone)"]
            
        vibrate()
        
        //chama controller pra mandar mensagem
        self.present(controller, animated: true, completion: nil)
            
    }
}
    // continuação da função pra chamar mensagem de texto, tava pedindo pra ter na documentação
     func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            switch (result) {
                case .cancelled:
                    print("Message was cancelled")
    //                dismiss(animated: true, completion: nil)
                case .failed:
                    print("Message failed")
    //                dismiss(animated: true, completion: nil)
                case .sent:
                    print("Message was sent")
    //                dismiss(animated: true, completion: nil)
                default:
                break
            }
            
            controller.dismiss(animated: true, completion: nil)
        }
    
    
    // função para chamar uma ligação para o profissional
    @objc func ligarParaProfissional(){
        
        // chama o numero do model
        let phone = empresa.telefone
        print("phone = ", phone)
        if let url = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
            print("entrou")
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
        vibrate()
    }
    
    
    // essa parte ainda não soube como fazer :(
    @IBAction func avaliarEstrela(_ sender: UIButton) {
        
        print("TAG: ", sender.tag)
        
        for i in 0...4 {
            if i <= sender.tag {
                botoesEstrela[i]?.setImage(#imageLiteral(resourceName: "star-gray"), for: .normal)
            }
            else {
                botoesEstrela[i]?.setImage(#imageLiteral(resourceName: "star-line"), for: .normal)
            }
        }
        
        //empresa.avaliacoes.append(Avaliacao(nota: sender.tag + 1, comentario: "") )
        tableView.reloadData()

        vibrate()
        
                
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AdicionarComentarioViewController") as? AdicionarComentarioViewController {
            vc.notaInicial = sender.tag
            vc.empresa = empresa
            //vc.volta = self
            //show(vc, sender: self)
            present(vc, animated: true) {
                self.tableView.reloadData()
            }
            //self.navigationController?.pushViewController(vc, animated: true)
            
            tableView.reloadData()
        }
        
    }
    
//    função pra feedback de vibração
    func vibrate(){
       
        let generator = UIImpactFeedbackGenerator()
        generator.impactOccurred()

    }
    
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
 
}



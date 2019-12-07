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

    @IBOutlet weak var tableView: UITableView!
    
//    -----------------APAGAR
    var empresa : Empresa?
    var avaliacao : Avaliacao!
    var avaliacoes : [Avaliacao] = []
    var endereco : Endereco!
//    -----------------APAGAR
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.dataSource = self
        tableView.delegate = self
        

//        tableView.reloadData()
        
    }


    //propriedades tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        TODO: Apagar a população aqui
        avaliacao = Avaliacao(nota: 3, comentario: "cuza1")
        let avaliacao2 = Avaliacao(nota: 2, comentario: "doida1")
        avaliacoes.append(avaliacao2)
        avaliacoes.append(avaliacao)
        
        endereco = Endereco(cep: 82030150, numero: 240, logradouro: "Rua Ferrara", bairro: "São João", cidade: "Curitiba", estado: "Taubatexas")
        empresa = Empresa(cnpj: "123124", nomeFantasia: "Conrider Da Nike", endereco: endereco, avaliacoes: avaliacoes, categoria: "Chinelero", telefone: "99671-4302", email: "conrider@nike.com", descricao: "alo alo voce sabem quem sou eu")
//      ---------------APAGAR

//        de 0 a 3 é padrão do perfil, depois disso tem que somar o numero de comentários do tipo Avaliações
        return 4 + avaliacoes.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // chamando a cell4 aqui pra não dar xabu no return lá no final dessa função da tableview
        let cell4 = tableView.dequeueReusableCell(withIdentifier: "Comentario", for: indexPath) as! ComentarioTableViewCell
        
        
        if indexPath.row == 0{
            
        let cell0 = tableView.dequeueReusableCell(withIdentifier: "NomeProfissional", for: indexPath) as! NomeProfissionalTableViewCell
            
//           nome no perfil
            cell0.lblNomeProfissional.text = empresa?.nomeFantasia

//            TODO: imagem profissional
//            cell0.imgProfissional.image =
            
//            TODO: media de avaliações
//            cell0.imgAvaliacao.image =
            
            self.tableView.rowHeight = 90
            
            return cell0
            
        }
            
        
        else if indexPath.row == 1{
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "DescricaoProfissional", for: indexPath) as! DescricaoProfissionalTableViewCell
            
//            cell1.txtDescricaoProfissional.text = empresa?.descricao
            
            self.tableView.rowHeight = 165

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

            self.tableView.rowHeight = 130
            
            
            return cell3
        }
        
        
        else {
            
            cell4.txtComentario.text = empresa?.avaliacoes[indexPath.row - 4].comentario
            
//            chamar imagem de quantas estrelas foram dadas
//            cell4.imgAvaliacao.image =
            
        }

        return cell4
        
    }

    // chama uma função pro botão da tableview para mandar mensagem de texto
    @objc func mandarMensagem(){
        
        if MFMessageComposeViewController.canSendText() {
        let controller = MFMessageComposeViewController()
        controller.messageComposeDelegate = self
        
        //conteudo da mensagem
            controller.body = "Olá, \(empresa!.nomeFantasia)! Encontrei seu perfil no app Somei e gostaria de solicitar um orçamento."
        //aqui chama o numero de telefone do model
            controller.recipients = ["\(empresa!.telefone)"]
            
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
        let phone = empresa!.telefone
        
        if let url = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
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
        
        vibrate()
        
    }
    
//    função pra feedback de vibração
    func vibrate(){
       
        let generator = UIImpactFeedbackGenerator()
        generator.impactOccurred()

    }
    
    @IBAction func deixarComentarioButton(_ sender: Any) {
        
        
        
    }
    
    
    
    
}

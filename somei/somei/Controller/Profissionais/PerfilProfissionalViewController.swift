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

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
        
    }
    
//    colar o numero de telefone dado pelo usuario no app de ligaçao
    private func callNumber(phoneNumber:String) {

         if let phoneCallURL = URL(string: "telprompt://\(phoneNumber)") {

             let application:UIApplication = UIApplication.shared
             if (application.canOpenURL(phoneCallURL)) {
                 if #available(iOS 10.0, *) {
                     application.open(phoneCallURL, options: [:], completionHandler: nil)
                 } else {
                     // Fallback on earlier versions
                      application.openURL(phoneCallURL as URL)

                 }
             }
         }
     }
    
    //propriedades tableview comentários
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell0 = tableView.dequeueReusableCell(withIdentifier: "NomeProfissional", for: indexPath) as! NomeProfissionalTableViewCell
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "DescricaoProfissional", for: indexPath) as! DescricaoProfissionalTableViewCell
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "BotaoContato", for: indexPath) as! BotaoContatoTableViewCell
        
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "AvaliacaoProfissional", for: indexPath) as! AvaliacaoProfissionalTableViewCell
        
        let cell4 = tableView.dequeueReusableCell(withIdentifier: "Comentario", for: indexPath) as! ComentarioTableViewCell

        if indexPath.row == 0{
            
            cell0.lblNomeProfissional.text = "Cristiano Correia"
//            cell0.imgProfissional.image =
//            cell0.imgAvaliacao.image =
            self.tableView.rowHeight = 90
            
            return cell0
        } else if indexPath.row == 1{
            
            cell1.txtDescricaoProfissional.text = "Experiência, qualidade e preço justo. Lâmpadas, refletores, montagem de quadros, passagem de fiação padrão Copel, tomadas, interruptores, disjuntores, DR, DDR. Comodidades: mais opções de pagamento, diversas áreas de atuação, garantia do serviço."
            
            self.tableView.rowHeight = 165

            return cell1
        } else if indexPath.row == 2{

//            cell2.ligarButton.titleLabel =
//            cell2.mensagemButton.titleLabel =
            
            cell2.mensagemButton.addTarget(self, action: #selector(mandarMensagem), for: .touchUpInside)
            cell2.ligarButton.addTarget(self, action: #selector(ligarParaProfissional), for: .touchUpInside)
            
            self.tableView.rowHeight = 140
            
            
            return cell2
        } else if indexPath.row == 3{
            
            
            self.tableView.rowHeight = 130
            
            
            return cell3
        } else{
            
            cell4.layer.cornerRadius = 10
            cell4.layer.shadowColor = UIColor.lightGray.cgColor
            cell4.layer.shadowOffset = CGSize(width: 1, height: 1.0)
            cell4.layer.shadowRadius = 1.5
            cell4.layer.shadowOpacity = 0.5
            cell4.layer.masksToBounds = false
            
        }
        
        return cell4
        
    }
    
    @objc func mandarMensagem(){
        
        print("fe")
        
        if MFMessageComposeViewController.canSendText() {
        let controller = MFMessageComposeViewController()
        controller.messageComposeDelegate = self
        
        //conteudo da mensagem
            let nome = "Carlitos Tevez"
        controller.body = "Olá \(nome)! Encontrei seu perfil no App Somei e gostaria de solicitar um orçamento, por favor."
        //aqui chama o numero de telefone do model
        controller.recipients = ["988384480"]
            
        vibrate()
            
        self.present(controller, animated: true, completion: nil)
            
        
    }
}
    
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
    
    
    
    @objc func ligarParaProfissional(){
        
        let phone = 988384480
        
        if let url = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
        vibrate()
    }
    
    @IBAction func avaliarEstrela(_ sender: UIButton) {
        
        vibrate()
        
    }
    
    func vibrate(){
       
        let generator = UIImpactFeedbackGenerator()
        generator.impactOccurred()

    }
    
    @IBAction func deixarComentarioButton(_ sender: Any) {
        
        
        
    }
    
    
    
    
}

//
//  BotaoContatoTableViewCell.swift
//  Somei
//
//  Created by Cristiano Correia on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import UIKit
import MessageUI


class BotaoContatoTableViewCell: UITableViewCell, MFMessageComposeViewControllerDelegate {
    
    @IBOutlet weak var ligarButton: UIButton!
    @IBOutlet weak var mensagemButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

     override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func ligar(_ sender: Any) {
        print("Call button pressed")
        
    }
    
//    enviar mensagem pelo app nativo Message
    @IBAction func mensagem(_ sender: Any) {
        print("Send button pressed")

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
    

}



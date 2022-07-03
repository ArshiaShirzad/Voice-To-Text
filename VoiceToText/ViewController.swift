//
//  ViewController.swift
//  VoiceToText
//
//  Created by Arshia Shirzad on 6/26/22.
//

import UIKit
import InstantSearchVoiceOverlay

class ViewController: UIViewController {

    let voiceOverlayController = VoiceOverlayController()
    
    @IBOutlet var finalText : UITextView!
    @IBOutlet var myButton: UIImageView!
    @IBOutlet var copyToClipboard: UIButton!
    @IBOutlet var DeleteText : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        copyToClipboard.layer.cornerRadius = 20
        DeleteText.layer.cornerRadius = 20
        finalText.layer.cornerRadius = 10
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.tappedImageView))
                        myButton.addGestureRecognizer(tapGR)
                        myButton.isUserInteractionEnabled = true
    }
   
    
    @objc func tappedImageView(sender: UITapGestureRecognizer){
        voiceOverlayController.start(on: self , textHandler: {text , final , _ in
            if final{
                print("Text : \(text)")
                
                self.finalText.text = text
                
                
            }else{
                print("In progress : \(text)")
            }
                
        }, errorHandler: {error in
            
        })
       
    }
    @IBAction func CopyToClipboard(){
        UIPasteboard.general.string = finalText.text
        
        let alert = UIAlertController(title: "Alert", message: "Copied to clipboard!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert , animated: true)
    }
    @IBAction func deleteText(){
        self.finalText.text = ""
        let alert = UIAlertController(title: "Alert", message: "Text deleted!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert , animated: true)
    }
}


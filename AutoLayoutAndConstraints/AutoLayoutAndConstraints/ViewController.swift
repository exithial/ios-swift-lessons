//
//  ViewController.swift
//  AutoLayoutAndConstraints
//
//  Created by Apiux on 18-10-21.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Actions
    
    @IBAction func myButtonAction(_ sender: Any) {
        if myLabel.text == "Hola Mundo" {
            myLabel.text = "Adiós Mundo"
        } else {
            myLabel.text = "Hola Mundo"
        }
    }
    
}


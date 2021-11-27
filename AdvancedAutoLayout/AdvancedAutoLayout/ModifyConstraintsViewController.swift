//
//  ModifyConstraintsViewController.swift
//  AdvancedAutoLayout
//
//  Created by Enrique Solís on 27-11-21.
//

import UIKit

class ModifyConstraintsViewController: UIViewController {

    @IBOutlet weak var heightConstraints: NSLayoutConstraint!
    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heightConstraints.constant = 300
        
        topConstraints.constant = 64
    }

}

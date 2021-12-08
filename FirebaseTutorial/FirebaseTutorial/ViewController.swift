//
//  ViewController.swift
//  FirebaseTutorial
//
//  Created by Enrique Solís on 08-12-21.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Analytics Event
        
        Analytics.logEvent(
            "InitScreen",
            parameters: [
                "controller": "ViewConroller",
                "message": "Integración de Firebase completa"
            ]
        )
        
    }


}


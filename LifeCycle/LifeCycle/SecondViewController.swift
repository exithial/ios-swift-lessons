//
//  SecondViewController.swift
//  LifeCycle
//
//  Created by Enrique Solís on 25-10-21.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Eston en VC2 y se activó -> \(#function)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Eston en VC2 y se activó -> \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Eston en VC2 y se activó -> \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Eston en VC2 y se activó -> \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Eston en VC2 y se activó -> \(#function)")
    }
}

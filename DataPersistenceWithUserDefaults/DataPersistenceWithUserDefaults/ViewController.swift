//
//  ViewController.swift
//  DataPersistenceWithUserDefaults
//
//  Created by Enrique Solís on 03-12-21.
//

import UIKit

class ViewController: UIViewController {
    
    private let kMyKey = "MY_KEY"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - UserDefaults

    // Recuperamos las preferencias
    @IBAction func getButtonAction(_ sender: Any) {
        if let value = UserDefaults.standard.string(forKey: kMyKey) {
            showAlert(message: value)
        } else {
            showAlert(message: "No hay un valor para esta clave")
        }
    }
    
    // Guarda las preferencias
    @IBAction func putButtonAction(_ sender: Any) {
        UserDefaults.standard.set("KEY DE PRUEBA", forKey: kMyKey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos guardado un valor")
    }
    
    // Borra las preferencias
    @IBAction func deleteButtonAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: kMyKey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos borrado un valor")
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "My UserDefaults", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


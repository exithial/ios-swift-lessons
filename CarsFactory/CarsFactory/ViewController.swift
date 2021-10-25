//
//  ViewController.swift
//  CarsFactory
//
//  Created by Enrique Solís on 22-10-21.
//

import UIKit

class ViewController: UIViewController {
    
    private var selectedCarType: Car.type?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // Actions
    
    @IBAction func createSimpleCarAction(_ sender: Any) {
        goToCarInformation(carType: .simple)
    }
    
    @IBAction func createElectricCarAction(_ sender: Any) {
        goToCarInformation(carType: .electric)
    }
    
    // Functions
    
    private func goToCarInformation(carType: Car.type) {
        selectedCarType = carType
        performSegue(withIdentifier: "carInformationSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CarInformationViewController {
            destination.selectedCarType = self.selectedCarType
        }
    }
}


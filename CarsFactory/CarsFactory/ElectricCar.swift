//
//  ElectricCar.swift
//  CarsFactory
//
//  Created by Enrique Solís on 23-10-21.
//

import Foundation

class ElectricCar: Car {
    
    var batteryPercentage = 100
    
    func batteryCharge() -> String {
        batteryPercentage = 100
        return "Carga exitosa"
    }
}

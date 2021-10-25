//
//  Car.swift
//  CarsFactory
//
//  Created by Enrique Solís on 22-10-21.
//

import Foundation

class Car {
    
    var color = "neutro"
    var tiresNumber = 4
    var price = 0
    var on = false
    
    func turnOn() {
        self.on = true
    }
    
    func turnOff() {
        self.on = false
    }
    
    func accelerate() -> Bool {
        return true
    }
    
    public enum type: String {
        case simple = "simple"
        case electric = "eléctrico"
    }
    
}

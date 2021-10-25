//
//  CarInformationViewController.swift
//  CarsFactory
//
//  Created by Enrique Solís on 22-10-21.
//

import UIKit

class CarInformationViewController: UIViewController {
    
    var selectedCarType: Car.type?
    var simpleCar: Car?
    var electricCar: ElectricCar?
    
    // Outlets
    
    @IBOutlet weak var myToggleInformationButton: UIButton!
    @IBOutlet weak var myCarImage: UIImageView!
    @IBOutlet weak var myInformationTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let carType = selectedCarType {
            title = "Vehículo de tipo \(carType.rawValue)"
            
            switch carType {
            case .simple:
                simpleCar = Car()
                simpleCar?.color = "Azul"
                simpleCar?.price = 5000
                
                myCarImage.image = UIImage(named: "simpleCar")
                break
            case .electric:
                electricCar = ElectricCar()
                electricCar?.color = "Rojo"
                electricCar?.price = 10000
                
                myCarImage.image = UIImage(named: "electricCar")
                break
            }
            
            myInformationTextView.text = "Se creo el vehículo \(carType.rawValue) correctamente"
        }
        
    }
    
    // Actions
    
    @IBAction func showInformationAction(_ sender: Any) {
        if let carType = selectedCarType {
            switch carType {
            case .simple:
                myInformationTextView.text = """
                    El vehículo tiene \(String(describing: simpleCar!.tiresNumber)) llantas, \
                    es de color \(String(describing: simpleCar!.color)) \
                    y su precio es de \(String(describing: simpleCar!.price)) USD
                    """
                break
            case .electric:
                myInformationTextView.text = """
                    El vehículo tiene \(String(describing: electricCar!.tiresNumber)) llantas, \
                    es de color \(String(describing: electricCar!.color)), \
                    su precio es de \(String(describing: electricCar!.price)) USD \
                    y su carga está al \(electricCar!.batteryPercentage)% de bateria
                    """
                break
            }
        }
    }
    
    @IBAction func turnOnAction(_ sender: Any) {
        if let carType = selectedCarType {
            switch carType {
            case .simple:
                if simpleCar!.on {
                    myInformationTextView.text = "El vehículo ya está encendido"
                } else {
                    simpleCar?.turnOn()
                    myInformationTextView.text = "El vehículo encendio correctamente"
                }
                break
            case .electric:
                if electricCar!.on {
                    myInformationTextView.text = "El vehículo ya está encendido"
                } else {
                    if electricCar!.batteryPercentage >= 5 {
                        electricCar?.turnOn()
                        myInformationTextView.text = "El vehículo encendio correctamente"
                        electricCar!.batteryPercentage -= 5
                    } else {
                        myInformationTextView.text = "Vehículo no puede encender pues no tiene bateria"
                    }
                }
                break
            }
        }
    }
    
    @IBAction func turnOffAction(_ sender: Any) {
        if let carType = selectedCarType {
            switch carType {
            case .simple:
                if !simpleCar!.on {
                    myInformationTextView.text = "El vehículo ya está apagado"
                } else {
                    simpleCar?.turnOff()
                    myInformationTextView.text = "El vehículo se apagó correctamente"
                }
                break
            case .electric:
                if !electricCar!.on {
                    myInformationTextView.text = "El vehículo ya está apagado"
                } else {
                    electricCar?.turnOff()
                    myInformationTextView.text = "El vehículo se apagó correctamente"
                }
                break
            }
        }
    }
    
    @IBAction func accelerateAction(_ sender: Any) {
        if let carType = selectedCarType {
            switch carType {
            case .simple:
                if simpleCar!.on {
                    if simpleCar!.accelerate() {
                        myInformationTextView.text = "Aceleración exitosa"
                    } else {
                        myInformationTextView.text = "Aceleración no exitosa"
                    }
                } else {
                    myInformationTextView.text = "El vehículo tiene que estar encendido para poder acelerar"
                }
                break
            case .electric:
                if electricCar!.on {
                    if electricCar!.accelerate() && electricCar!.batteryPercentage >= 10 {
                        myInformationTextView.text = "Aceleración exitosa"
                        electricCar!.batteryPercentage -= 10
                    } else {
                        electricCar?.turnOff()
                        myInformationTextView.text = "Vehículo no puede acelerar pues no tiene bateria, vehículo se ha apagado"
                    }
                } else {
                    myInformationTextView.text = "El vehículo tiene que estar encendido para poder acelerar"
                }
                break
            }
        }
    }
    
    
}

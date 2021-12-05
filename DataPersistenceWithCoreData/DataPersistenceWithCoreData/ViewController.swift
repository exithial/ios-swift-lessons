//
//  ViewController.swift
//  DataPersistenceWithCoreData
//
//  Created by Enrique Solís on 04-12-21.
//

import UIKit
// 1.- Importar libreria Core Data
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // 2.- Referencia al managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // 3.- Cambiar a variable de tipo pais sin datos iniciales
    private var myCountries:[Pais]?
    
    //private let myCountries = ["España", "Mexico", "Perú", "Colombia", "Argentina", "EEUU", "Francia", "Italia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // 4.- Recuperar datos
        recuperarDatos()
    }
    
    @IBAction func add(_ sender: Any) {
        //print("Añadir Datos")
        
        // Crear Alerta
        let alert = UIAlertController(title: "Añadir", message: "Añade un país nuevo", preferredStyle: .alert)
        
        // Crear y configurar botón de alerta
        let botonAlerta = UIAlertAction(title: "Añadir", style: .default, handler: {(action) in
            
            // Recuperar textField de la alerta
            let textField = alert.textFields![0]
            
            // Crear objeto Pais si no existe previamente
            let exist = self.myCountries?.contains(where: {element in
                return element.nombre == textField.text
            })
            
            if !exist! {
                let nuevoPais = Pais(context: self.context)
                nuevoPais.nombre = textField.text
                
                // Guardar información (Añade block do-try-catch)
                try! self.context.save() // Le decimos al programa que no hay error
                
                // Refrescar información en tableView
                self.recuperarDatos()
            } else {
                let errorAlert = UIAlertController(title: "Error", message: "No se pudo añadir el país pues ya existe en el listado", preferredStyle: .alert)
                let errorButton = UIAlertAction(title: "Entendido", style: .default, handler: nil)
                errorAlert.addAction(errorButton)
                self.present(errorAlert, animated: true, completion: nil)
            }
            
        })
        
        // Añadir textField y botón a la alerta, posteriormente mostrarla
        alert.addTextField(configurationHandler: nil)
        alert.addAction(botonAlerta)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    private func recuperarDatos() {
        do {
            self.myCountries = try context.fetch(Pais.fetchRequest())
                        
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
            print("Error recuperando datos")
        }
    }
    

}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
            if cell == nil {
               
                cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                
            }
        cell!.textLabel?.text = myCountries![indexPath.row].nombre
            return cell!
      
            
       
    }
    
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print(myCountries![indexPath.row].nombre!)
    }
    
    // 6.- Añadir funcionalidad de swipe para eliminar
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Crear acción de eliminar
        let deleteAction = UIContextualAction(style: .destructive, title: "Eliminar", handler: {(action, view, completionHandler) in
            // Cual país se eliminara?
            let deleteCountry = self.myCountries![indexPath.row]
            
            // Eliminar país
            self.context.delete(deleteCountry)
            
            // Guardar el cambio de información
            try! self.context.save()
            
            // Recargar datos
            self.recuperarDatos()
        })
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    // 7.- Añadir funcionalidad de editar
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Crear acciín  de editar
        let editAction = UIContextualAction(style: .normal, title: "Editar", handler: {(action, view, completionHandler) in
            // Cual país se editará
            let editCountry = self.myCountries![indexPath.row]
            
            // Crear Alerta
            let alert = UIAlertController(title: "Editar", message: "Edita el país", preferredStyle: .alert)
            
            // Creamos y editamos TextField de alerta
            alert.addTextField(configurationHandler: nil)
            let textField = alert.textFields![0]
            
            textField.text = editCountry.nombre
            
            // Crear y configurar botón de alerta
            let botonAlerta = UIAlertAction(title: "Editar", style: .default, handler: {(action) in
                
                // Recuperar textField de la alerta
                let textField = alert.textFields![0]
                
                // Crear objeto Pais si no existe previamente
                let exist = self.myCountries?.contains(where: {element in
                    return element.nombre == textField.text
                })
                
                if !exist! || textField.text == editCountry.nombre {
                    editCountry.nombre = textField.text
                    
                    // Guardar información (Añade block do-try-catch)
                    try! self.context.save() // Le decimos al programa que no hay error
                    
                    // Refrescar información en tableView
                    self.recuperarDatos()
                } else {
                    let errorAlert = UIAlertController(title: "Error", message: "No se pudo editar el país pues ya existe en el listado", preferredStyle: .alert)
                    let errorButton = UIAlertAction(title: "Entendido", style: .default, handler: nil)
                    errorAlert.addAction(errorButton)
                    self.present(errorAlert, animated: true, completion: nil)
                }
                
            })
            
            // Añadir botón a la alerta, posteriormente mostrarla
            alert.addAction(botonAlerta)
            self.present(alert, animated: true, completion: nil)
        })
        
        editAction.backgroundColor = UIColor(red: 240.0/255, green: 173.0/255, blue: 78.0/255, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [editAction])
    }
    
}


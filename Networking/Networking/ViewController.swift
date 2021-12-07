//
//  ViewController.swift
//  Networking
//
//  Created by Enrique Solís on 05-12-21.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var downloadImageButton: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearLabels()
        nameLabel.numberOfLines = 0
        emailLabel.numberOfLines = 0
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }

    @IBAction func getUserAction(_ sender: Any) {
        clearLabels()
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.getUser(id: 3239, success: {(user) in
            
            self.activityIndicator.stopAnimating()
            self.setup(user)
            
        }, failure: {(error) in
            
            self.activityIndicator.stopAnimating()
            self.printError(error)
            
        })
    }
    
    @IBAction func addUserAction(_ sender: Any) {
        let newUser = NewUser(name: "ESEG", email: "enrique@eseg.cl", gender: "Male", status: "Active")
        
        clearLabels()
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.addUser(user: newUser) { user in
            
            self.activityIndicator.stopAnimating()
            self.setup(user)
            
        } failure: { error in
            
            self.activityIndicator.stopAnimating()
            self.printError(error)
            
        }

    }
    
    @IBAction func updateUserAction(_ sender: Any) {
        let newUser = NewUser(name: "ESEG 2", email: nil, gender: nil, status: nil)
        
        clearLabels()
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.updateUser(id: 3239, user: newUser) { user in
            
            self.activityIndicator.stopAnimating()
            self.setup(user)
            
        } failure: { error in
            
            self.activityIndicator.stopAnimating()
            self.printError(error)
            
        }
    }
    
    @IBAction func deleteUserAction(_ sender: Any) {
        clearLabels()
        activityIndicator.startAnimating()
        
        let id = 3239
        
        NetworkingProvider
            .shared.deleteUser(id: id) {
                
                self.activityIndicator.stopAnimating()
                self.nameLabel.text = "Se ha borrado el usuario con ID: \(id)"
                self.emailLabel.text = ""
                self.idLabel.text = ""

                
            } failure: { error in
                
                self.activityIndicator.stopAnimating()
                self.printError(error)
                
            }

    }
    
    @IBAction func downloadImageAction(_ sender: Any) {
        downloadImageButton.isHidden = true
        activityIndicator.startAnimating()
        
        logoImageView.kf.setImage(with: URL(string: "https://icon-library.com/images/swift-icon/swift-icon-10.jpg")){
            result in
            switch result {
            case .success(_):
                self.activityIndicator.stopAnimating()
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    private func setup(_ user: User) {
        self.nameLabel.text = user.name
        self.emailLabel.text = user.email
        self.idLabel.text = user.id?.description
    }
    
    private func printError(_ error: Error?) {
        self.nameLabel.text = error.debugDescription
        self.emailLabel.text = ""
        self.idLabel.text = ""
    }
    
    private func clearLabels() {
        self.nameLabel.text = ""
        self.emailLabel.text = ""
        self.idLabel.text = ""
    }
}


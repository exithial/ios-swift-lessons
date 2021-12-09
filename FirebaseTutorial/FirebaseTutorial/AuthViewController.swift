//
//  AuthViewController.swift
//  FirebaseTutorial
//
//  Created by Enrique Solís on 08-12-21.
//

import UIKit
import Firebase
import FirebaseAnalytics
import FirebaseAuth
import GoogleSignIn

class AuthViewController: UIViewController {
    
    @IBOutlet weak var authStackView: UIStackView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Autenticación"
        
        // Analytics Event
        Analytics.logEvent(
            "InitScreen",
            parameters: [
                "controller": "AuthViewConroller",
                "message": "Integración de Firebase completa"
            ]
        )
        
        let googleLogo = UIImage(named: "google-logo")!.resize(maxWidthHeight: 30)
    
        googleButton.setImage(googleLogo, for: .normal)
        
        // Comprobar la sesión del usuario autenticado
        let defaults = UserDefaults.standard
        if let email = defaults.value(forKey: "email") as? String,
           let provider = defaults.value(forKey: "provider") as? String {
            authStackView.isHidden = true
            self.navigationController?.pushViewController(
                HomeViewController(
                    email: email,
                    provider: ProviderType.init(rawValue: provider)!
                ),
                animated: false
            )
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        authStackView.isHidden = false
    }

    @IBAction func signUpButtonAction(_ sender: Any) {
        if let email =  emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) {
                result, error in
                self.showHome(result: result, error: error, provider: .basic)
            }
        }
    }
    
    @IBAction func logInButtonAction(_ sender: Any) {
        if let email =  emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) {
                result, error in
                self.showHome(result: result, error: error, provider: .basic)
            }
        }
    }
    
    @IBAction func googleButtonAction(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in

            if error == nil && user?.authentication != nil {
                let credential = GoogleAuthProvider.credential(withIDToken: (user?.authentication.idToken)!,
                                                               accessToken: (user?.authentication.accessToken)!)
                
                Auth.auth().signIn(with: credential) { result, error in
                    self.showHome(result: result, error: error, provider: .google)
                }
            }

        }
    }
    
    private func showHome(result: AuthDataResult?, error: Error?, provider: ProviderType) {
        if let result = result, error == nil {
            self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: provider), animated: true)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Se ha producido un error de autenticación mediante \(provider.rawValue)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
}

extension UIImage {

    func resize(maxWidthHeight : Double)-> UIImage? {

        let actualHeight = Double(size.height)
        let actualWidth = Double(size.width)
        var maxWidth = 0.0
        var maxHeight = 0.0

        if actualWidth > actualHeight {
            maxWidth = maxWidthHeight
            let per = (100.0 * maxWidthHeight / actualWidth)
            maxHeight = (actualHeight * per) / 100.0
        }else{
            maxHeight = maxWidthHeight
            let per = (100.0 * maxWidthHeight / actualHeight)
            maxWidth = (actualWidth * per) / 100.0
        }

        let hasAlpha = true
        let scale: CGFloat = 0.0

        UIGraphicsBeginImageContextWithOptions(CGSize(width: maxWidth, height: maxHeight), !hasAlpha, scale)
        self.draw(in: CGRect(origin: .zero, size: CGSize(width: maxWidth, height: maxHeight)))

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }

}

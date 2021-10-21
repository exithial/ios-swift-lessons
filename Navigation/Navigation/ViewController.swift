import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func blackButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "blackSegue", sender: self)
    }
    
    @IBAction func pinkButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "pinkSegue", sender: self)
    }
    
    @IBAction func greenButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "greenSegue", sender: self)
    }
    
    func goToColor(evaluateSegue: String, customTitle: String, segue: UIStoryboardSegue) {
        if segue.identifier == evaluateSegue {
            if let destino = segue.destination as? ViewControllerColor {
                destino.customTitle = customTitle
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        goToColor(evaluateSegue: "blackSegue", customTitle: "Negro", segue: segue)
        goToColor(evaluateSegue: "pinkSegue", customTitle: "Rosa", segue: segue)
        goToColor(evaluateSegue: "greenSegue", customTitle: "Verde", segue: segue)
    }
}


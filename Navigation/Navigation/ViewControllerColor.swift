import UIKit

class ViewControllerColor: UIViewController {
    
    var customTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let finalTitle = customTitle {
            self.title = finalTitle
            if let color = finalTitle.color() {
                self.view.backgroundColor = color
            }
        }
    }
    

}

extension String {
    func color() -> UIColor? {
        switch(self){
        case "Negro":
            return UIColor.black
        case "Rosa":
            return UIColor.systemPink
        case "Verde":
            return UIColor.systemGreen
        default:
            return nil
        }
    }
}

//
//  ViewController.swift
//  ViewsAndNavigationControls
//
//  Created by Apiux on 18-10-21.
//

import UIKit
import WebKit
import MapKit

class ViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myFakeView: UIView!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "My View Controller"
        
        myWebView.load(URLRequest(url: URL(string: "https://google.es")!))
        
        myMapView.centerCoordinate = CLLocationCoordinate2D(latitude: -33.5291239, longitude: -70.6906795)
        
        
    }
    
    // Actions
    
    @IBAction func myButtonAction(_ sender: Any) {
        myView.isHidden = true
        myFakeView.isHidden = true
    }
    
}


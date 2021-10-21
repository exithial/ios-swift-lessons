//
//  ViewController.swift
//  ControlsAndTextViews
//
//  Created by Apiux on 12-10-21.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var myStepperLabel: UILabel!
    @IBOutlet weak var mySwitchLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    // Variables
    
    private let myPickerViewValues = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Buttons
        
        myButton.setTitle("Mi Botón", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        // Pickers
        
        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.isHidden = true
        
        // PageControls
        
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .lightGray
        
        // SegmentedControls
        
        mySegmentedControl.removeAllSegments()
        for (index, value) in myPickerViewValues.enumerated(){
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        // Sliders
        
        mySlider.minimumTrackTintColor = .red
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(myPickerViewValues.count)
        mySlider.value = 1
        
        // Steppers
        
        myStepper.minimumValue = 0
        myStepper.maximumValue = Double(myPickerViewValues.count - 1)
        
        // Switch's
        
        mySwitch.onTintColor = .purple
        mySwitch.isOn = false
        
        // Progress Views
        
        myProgressView.progress = 0.2
        
        // Activity Indicator Views
       
        myActivityIndicatorView.color = .orange
        myActivityIndicatorView.startAnimating()
        myActivityIndicatorView.hidesWhenStopped = true
        
        // Labels
        
        myStepperLabel.textColor = .darkGray
        myStepperLabel.font = UIFont.boldSystemFont(ofSize: 36)
        myStepperLabel.text = "1"
        
        mySwitchLabel.text = "Apagado"
        
        // Text Fields
        
        myTextField.textColor = .brown
        myTextField.placeholder = "Escribe algo"
        myTextField.delegate = self
        
        // Text Views
        
        myTextView.textColor = .brown
        //myTextView.isEditable = false
        myTextView.delegate = self
        
        
    }
    
    // Actions
    
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .green
        } else {
            myButton.backgroundColor = .blue
        }
        
        myTextView.resignFirstResponder()
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        let value = myPageControl.currentPage
        myPickerView.selectRow(value, inComponent: 0, animated: true)
        myButton.setTitle(myPickerViewValues[value], for: .normal)
        mySegmentedControl.selectedSegmentIndex = value
        mySlider.value = Float(value + 1)
        myStepper.value = Double(value)
        mySliderFunc()
        myStepperLabel.text = "\(value + 1)"
    }
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        let value = mySegmentedControl.selectedSegmentIndex
        myPickerView.selectRow(value, inComponent: 0, animated: true)
        myButton.setTitle(myPickerViewValues[value], for: .normal)
        myPageControl.currentPage = value
        mySlider.value = Float(value + 1)
        myStepper.value = Double(value)
        mySliderFunc()
        myStepperLabel.text = "\(value + 1)"
    }
    
    @IBAction func mySliderAction(_ sender: Any) {
        mySliderFunc()
    }
    
    @IBAction func myStepperAction(_ sender: Any) {
        let value = myStepper.value
        myPickerView.selectRow(Int(value), inComponent: 0, animated: true)
        myButton.setTitle(myPickerViewValues[Int(value)], for: .normal)
        myPageControl.currentPage = Int(value)
        mySlider.value = Float(value + 1)
        mySegmentedControl.selectedSegmentIndex = Int(value)
        mySliderFunc()
        myStepperLabel.text = "\(Int(value + 1))"
    }
    
    @IBAction func mySwitchAction(_ sender: Any) {
        if mySwitch.isOn {
            myPickerView.isHidden = false
            myActivityIndicatorView.stopAnimating()
            mySwitchLabel.text = "Encendido"
        } else {
            myPickerView.isHidden = true
            myActivityIndicatorView.startAnimating()
            mySwitchLabel.text = "Apagado"
        }
    }
    
    // Functions
    
    func mySliderFunc(){
        var progress: Float = 0
        
        switch mySlider.value {
            case 1..<2:
                mySliderActionChangeOthers(value: 0)
                progress = 0.2
            case 2..<3:
                mySliderActionChangeOthers(value: 1)
                progress = 0.4
            case 3..<4:
                mySliderActionChangeOthers(value: 2)
                progress = 0.6
            case 4..<5:
                mySliderActionChangeOthers(value: 3)
                progress = 0.8
            default:
                mySliderActionChangeOthers(value: 4)
                progress = 1.0
        }
        
        myProgressView.progress = progress
    }
    
    func mySliderActionChangeOthers(value: Int){
        myPickerView.selectRow(value, inComponent: 0, animated: true)
        myButton.setTitle(myPickerViewValues[value], for: .normal)
        mySegmentedControl.selectedSegmentIndex = value
        myPageControl.currentPage = value
        myStepper.value = Double(value)
        myStepperLabel.text = "\(value + 1)"
    }
    
}

// UIPickerViewDataSource, UIPickerViewDelegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let value = row
        myButton.setTitle(myPickerViewValues[value], for: .normal)
        myPageControl.currentPage = value
        mySegmentedControl.selectedSegmentIndex = value
        mySlider.value = Float(value + 1)
        myStepper.value = Double(value)
        mySliderFunc()
        myStepperLabel.text = "\(value + 1)"
    }
}

// UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myButton.setTitle(myTextField.text, for: .normal)
    }
}

// UITextViewDelegate
extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        myTextField.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        myTextField.isHidden = false
    }
}

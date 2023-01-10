//
//  ViewController.swift
//  UIPickerView
//
//  Created by Ahmed Salem on 10/01/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var sportTextField: UITextField!
    
    @IBOutlet weak var getResultsButton: UIButton!
    
    @IBOutlet weak var result: UILabel!
    
    let countries = ["Egypt", "Brazil", "USA", "UK", "Germany", "Italy", "Spain"]
    let colors = ["Red", "Blue", "Green"]
    let sports = ["FootBall", "Basket Ball", "Swimming", "Camping"]
    
    var countryPickerView = UIPickerView()
    var colorPickerView = UIPickerView()
    var sportPickerView = UIPickerView()
    
    @IBAction func getResultActrion(_ sender: UIButton) {
        // Mark:- test the output for each input and print it
        guard let countryText = countryTextField.text else { return  }
        guard let colorText = colorTextField.text else { return  }
        guard let sportText = sportTextField.text else { return }
        if !countryText.isEmpty && !colorText.isEmpty && !sportText.isEmpty
        {
            result.text! = countryText
            result.text! += colorText
            result.text! += sportText
        }else{
            result.text! = "You have to select your Country , Color, and Sports"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Mark:- setting UIpickers to the textfields
        countryTextField.inputView = countryPickerView
        colorTextField.inputView = colorPickerView
        sportTextField.inputView = sportPickerView
        
        // Mark:- setting Placeholders  for the text fields
        countryTextField.placeholder = "Select Country"
        colorTextField.placeholder = "Select Color"
        sportTextField.placeholder = "Select Sports"
        
        // Marks:- setting the style of the text fields
        countryTextField.textAlignment = .center
        colorTextField.textAlignment = .center
        sportTextField.textAlignment = .center
        
        // Mark:- Delegation and Datasource for UIPicker View Controller
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        colorPickerView.delegate = self
        colorPickerView.dataSource = self
        sportPickerView.delegate = self
        sportPickerView.dataSource = self
        
        // Mark:- adding tags for all UIPicker view
        countryPickerView.tag = 1
        colorPickerView.tag = 2
        sportPickerView.tag = 3
        
        
        
    }


}

//Mark:- UIPicker View Delegate and Datasource conforming
extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            print("\(countries.count)")
            return countries.count
        case 2:
            print("\(colors.count)")
            return colors.count
        case 3:
            print("\(sports.count)")
            return sports.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return countries[row]
        case 2:
            return colors[row]
        case 3:
            return sports[row]
        default:
            return "There's not data to show."
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            countryTextField.text = countries[row]
            countryTextField.resignFirstResponder()
        case 2:
            colorTextField.text = colors[row]
            colorTextField.resignFirstResponder()
        case 3:
            sportTextField.text = sports[row]
            sportTextField.resignFirstResponder()
        default:
            return
        }
    }
}




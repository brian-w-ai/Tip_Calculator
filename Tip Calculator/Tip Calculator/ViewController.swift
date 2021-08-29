//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Brian Ai on 8/25/21.
//

import UIKit

var tipPercentages = [15.0, 18.0, 20.0]

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    
    @IBOutlet weak var peopleAmountLabel: UILabel!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalLabel: UILabel!
        
    @IBOutlet weak var peopleStepper: UIStepper!
    
    @IBOutlet weak var splitAmount: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        // Get user stored values for tip percentages
        let tipPercentages1 = defaults.object(forKey: "tip1") as? Double ?? Double()
        let tipPercentages2 = defaults.object(forKey: "tip2") as? Double ?? Double()
        let tipPercentages3 = defaults.object(forKey: "tip3") as? Double ?? Double()
        
        tipPercentages = [tipPercentages1/100, tipPercentages2/100, tipPercentages3/100]
        
        // Set title of tip options in segmented control
        tipControl.setTitle(String(format: "%.0f%%", tipPercentages[0] * 100), forSegmentAt: 0)
        tipControl.setTitle(String(format: "%.0f%%", tipPercentages[1] * 100), forSegmentAt: 1)
        tipControl.setTitle(String(format: "%.0f%%", tipPercentages[2] * 100), forSegmentAt: 2)
        
        calculateTip(UIButton())
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        
        // Sets bill amount to be the first thing user inputs
        billAmountTextField.becomeFirstResponder()
        
        // configure people amount stepper
        peopleStepper.wraps = true
        peopleStepper.autorepeat = true
        peopleStepper.maximumValue = 9
    }
    
    @IBAction func changePeopleAmount(_ sender: UIStepper) {
        peopleAmountLabel.text = (Int(sender.value) + 1).description
        getBill()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        getBill()
    }
    
    func getBill() {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        let people = Int(peopleAmountLabel.text!) ?? 1
        // Get Total tip by multiplying tip * tipPercentage
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let split = total/Double(people)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        
        // Update Tip Amount Label
        tipAmountLabel.text = formatter.string(from: tip as NSNumber)
        // Update Split Amount
        splitAmount.text = formatter.string(from: split as NSNumber)
        // Update Total Amount
        totalLabel.text = formatter.string(from: total as NSNumber)
    }
    
    
}


//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Brian Ai on 8/26/21.
//

import UIKit

let defaults = UserDefaults.standard

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tip1TextField: UITextField!
    @IBOutlet weak var tip2TextField: UITextField!
    @IBOutlet weak var tip3TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //defaults.set(Double(tip1TextField.text!) ?? 15, forKey: "tip1")
        //defaults.set(Double(tip2TextField.text!) ?? 18, forKey: "tip2")
        //defaults.set(Double(tip3TextField.text!) ?? 20, forKey: "tip3")
        
        tip1TextField.text = String(defaults.object(forKey: "tip1") as? Double ?? Double())
        tip2TextField.text = String(defaults.object(forKey: "tip2") as? Double ?? Double())
        tip3TextField.text = String(defaults.object(forKey: "tip3") as? Double ?? Double())
        
        self.title = "Settings"
        
    }
        
    @IBAction func restoreDefaultTips(_ sender: Any) {
        defaults.set(15, forKey: "tip1")
        defaults.set(18, forKey: "tip2")
        defaults.set(20, forKey: "tip3")
        tip1TextField.text = "15.0"
        tip2TextField.text = "18.0"
        tip3TextField.text = "20.0"
    }
    
    @IBAction func updateTip1(_ sender: Any) {
        defaults.set(Double(tip1TextField.text!) ?? 15, forKey: "tip1")
    }
    
    @IBAction func updateTip2(_ sender: Any) {
        defaults.set(Double(tip2TextField.text!) ?? 18, forKey: "tip2")
    }
    
    @IBAction func updateTip3(_ sender: Any) {
        defaults.set(Double(tip3TextField.text!) ?? 20, forKey: "tip3")
    }
    
    @IBAction func setDefaultTips(_ sender: Any) {
        defaults.set(Double(tip1TextField.text!) ?? 15, forKey: "tip1")
        defaults.set(Double(tip2TextField.text!) ?? 18, forKey: "tip2")
        defaults.set(Double(tip3TextField.text!) ?? 20, forKey: "tip3")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

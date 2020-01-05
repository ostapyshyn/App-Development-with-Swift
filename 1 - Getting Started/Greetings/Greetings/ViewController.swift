//
//  ViewController.swift
//  Greetings
//
//  Created by Volodymyr Ostapyshyn on 05.01.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var lowerLabel: UILabel!
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        lowerLabel.text = "Hello " + textField.text!
        
        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


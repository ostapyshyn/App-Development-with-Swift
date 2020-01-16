//
//  ViewController.swift
//  Two Buttons
//
//  Created by Volodymyr Ostapyshyn on 15.01.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func setTextButtonTapped(_ sender: Any) {
        //“Implement the setTextButtonTapped action to set the label.text to the current text in the textfield.
        label.text = textField.text
        
        
        

       
    }
    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        label.text = ""
        textField.text = ""
        
    }
}


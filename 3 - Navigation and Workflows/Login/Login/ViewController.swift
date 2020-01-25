//
//  ViewController.swift
//  Login
//
//  Created by Volodymyr Ostapyshyn on 24.01.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textFieldUserName: UITextField!
    @IBOutlet var forgetUserName: UIButton!
    @IBOutlet var forgotPassword: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue.destination.navigationItem.title = textFieldUserName.text
        guard let sender = sender as? UIButton else {return}
        
        if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgetUserName {
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            segue.destination.navigationItem.title = textFieldUserName.text
        }
        
        
    }
    
    
    
    
    
    @IBAction func forgotUserName(_ sender: Any) {
        performSegue(withIdentifier: "toRed", sender: forgetUserName)
    }
    
    
    @IBAction func forgotPassword(_ sender: Any) {
        performSegue(withIdentifier: "toRed", sender: forgotPassword)
    }
    
    
    
    
}


//
//  ViewController.swift
//  Contest
//
//  Created by Volodymyr Ostapyshyn on 16.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButton(_ sender: UIButton) {
        if textField.text?.isEmpty == true {
            UIView.animate(withDuration: 0.5, delay: 0.0,
                           usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3,
                           options: [], animations: {
                            self.textField.transform = CGAffineTransform(translationX: 12, y: 0)
                           }, completion: {_ in
                            self.textField.transform = CGAffineTransform.identity
                           })
            
        } else {
            performSegue(withIdentifier: "second", sender: self)
        }
        
    }
    
}


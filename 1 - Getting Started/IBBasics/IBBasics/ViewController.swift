//
//  ViewController.swift
//  IBBasics
//
//  Created by Volodymyr Ostapyshyn on 04.01.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myButton: UIButton!
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        print("button was pressed")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.setTitleColor(.red, for: .normal)
        // Do any additional setup after loading the view.
    }


}


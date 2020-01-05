//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Volodymyr Ostapyshyn on 05.01.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    
    @IBAction func changeTitle(_ sender: Any) {
        mainLabel.text = "This app rocks!"
                
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


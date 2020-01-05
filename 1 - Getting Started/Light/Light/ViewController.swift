//
//  ViewController.swift
//  Light
//
//  Created by Volodymyr Ostapyshyn on 05.01.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lightButton: UIButton!
    
    var lightOn = true
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        lightOn.toggle()
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        if lightOn {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .black
        }
    }


}


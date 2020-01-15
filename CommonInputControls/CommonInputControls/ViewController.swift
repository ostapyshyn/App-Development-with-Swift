//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Volodymyr Ostapyshyn on 14.01.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var toggle: UISwitch!
    
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonMain.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
    }
    
    

    @IBOutlet var buttonMain: UIButton!
    
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        buttonMain.setTitle("Pressed", for: .normal)
        print("Button was tapped!")
        if toggle.isOn {
            print("The switch is on!")
        } else {
            print("The switch is off!")
        }
        print("The slider is set to \(slider.value)")
    }
    
    @IBAction func toggleSwitched(_ sender: UISwitch) {
        if sender.isOn {
            print("The switch is on!")
        } else {
            print("The switch is off!")
        }
    }
    @IBOutlet var topLabel: UILabel!
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let text = sender.text {
            
            print(text)
        }
    }
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        
        
        if let text = sender.text {
            topLabel.text = text
            print(text)
        }
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        
    }
    
    
    
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
    
    
    
    
    
}


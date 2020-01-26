//
//  ViewController.swift
//  RainbowTabs
//
//  Created by Volodymyr Ostapyshyn on 25.01.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBarItem.badgeValue = "!"

    }


    @IBAction func plusTapped(_ sender: UIButton) {
        let action = sender.titleLabel?.text ?? nil
        
        print(Date(), #line, #function, action)
        
        switch action {
        case "+":
            break;
        case "-":
            print("minus")
            let count = tabBarController?.viewControllers?.count ?? 0
            print(#line, #function, count)
            break;
        default:
            break;
        }
    }
}


//
//  ViewController.swift
//  AppEventCount2020
//
//  Created by Volodymyr Ostapyshyn on 25.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var didFinishLaunching: UILabel!
    @IBOutlet var configurationForConnecting: UILabel!
    @IBOutlet var willConnectTo: UILabel!
    @IBOutlet var DidBecomeActive: UILabel!
    @IBOutlet var WillResignActive: UILabel!
    @IBOutlet var WillEnterForeground: UILabel!
    @IBOutlet var DidEnterBackground: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


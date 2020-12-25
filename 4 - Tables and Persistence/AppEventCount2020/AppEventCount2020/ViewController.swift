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
    @IBOutlet var didBecomeActive: UILabel!
    @IBOutlet var willResignActive: UILabel!
    @IBOutlet var willEnterForeground: UILabel!
    @IBOutlet var didEnterBackground: UILabel!
    
    var willConnectCount = 0
    var didBecomeActiveCount = 0
    var willResignActiveCount = 0
    var willEnterForegroundCount = 0
    var didEnterBackgroundCount = 0
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        didFinishLaunching.text = "The App has launched \(appDelegate.launchCount) time(s)"
        configurationForConnecting.text = "configurationForConnecting \(appDelegate.configurationForConnectingCount) time(s)"
        willConnectTo.text = "willConnectTo \(willConnectCount) time(s)"
        didBecomeActive.text = "didBecomeActive \(didBecomeActiveCount) time(s)"
        willResignActive.text = "willResignActive \(willResignActiveCount) time(s)"
        willEnterForeground.text = "willEnterForeground \(willEnterForegroundCount) time(s)"
        didEnterBackground.text = "didEnterBackground \(didEnterBackgroundCount) time(s)"
    }
    
    
}


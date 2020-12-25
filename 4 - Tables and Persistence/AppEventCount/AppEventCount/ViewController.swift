//
//  ViewController.swift
//  AppEventCount
//
//  Created by Volodymyr Ostapyshyn on 05.02.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }
    
    let text = "d"
    
    
    @IBOutlet var didFinishLaunching: UILabel!
    
    @IBOutlet var configurationForConnecting: UILabel!
   
    @IBOutlet var willConnectTo: UILabel!
    
    @IBOutlet var DidBecomeActive: UILabel!
    @IBOutlet var WillResignActive: UILabel!
    @IBOutlet var WillEnterForeground: UILabel!
    @IBOutlet var DidEnterBackground: UILabel!
    
    var finishLaunch = 0
    var resignActive = 0
    var becomeActive = 0
    var didEnteredBackground = 0
    var willEnterForeground = 0
    var willTerminate = 0
    
    func updateView() {
        didFinishLaunching.text = "finish launch  \(finishLaunch)"
        WillResignActive.text = "will resign active \(resignActive)"
        DidBecomeActive.text = "did become active \(becomeActive)"
        DidEnterBackground.text = "did enter background \(didEnteredBackground)"
        WillEnterForeground.text = "will enter foreground \(willEnterForeground)"
        WillTerminate.text = "will terminate \(willTerminate)"
    }
    


}


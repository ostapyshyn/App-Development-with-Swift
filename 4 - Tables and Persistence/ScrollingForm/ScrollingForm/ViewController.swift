//
//  ViewController.swift
//  ScrollingForm
//
//  Created by Volodymyr Ostapyshyn on 10.04.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

//   func registerForKeyboardNotifications() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: .UIKeyboardDidShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden), name: .UIKeyboardWillHide, object: nil)
//    }
//
//    @objc func keyboardWasShown(_ notification: NSNotification) {
//        guard let info = notification.userInfo,
//            let keyboardFrameValue = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
//
//        let keyboardFrame = keyboardFrameValue.cgRectValue
//        let keyboardSize = keyboardFrame.size
//
//        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
//        scrollView.contentInset = contentInsets
//        scrollView.scrollIndicatorInsets = contentInsets
//    }
//
//    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
//        let contentInsets = UIEdgeInsets.zero
//        scrollView.contentInset = contentInsets
//        scrollView.scrollIndicatorInsets = contentInsets
//    }
    
    
    
    
}


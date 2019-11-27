//
//  ViewController.swift
//  spotLogin
//
//  Created by Siddhesh Redkar on 2019-11-27.
//  Copyright © 2019 Siddhesh Redkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension UIViewController{
    func hideKeyboardTapAround(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmissKeyboard(){
        view.endEditing(true)
        
    }
}


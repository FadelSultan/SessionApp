//
//  ViewController.swift
//  TestLogin
//
//  Created by fadel sultan on 11/15/17.
//  Copyright © 2017 fadel sultan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnLogin(_ sender: Any) {
        
        UserDefaults.standard.set("Fadel", forKey: "User")
        UserDefaults.standard.synchronize()
        self.dismiss(animated: true, completion: nil)
    }
    

}


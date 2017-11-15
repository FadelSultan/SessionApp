//
//  Welcome.swift
//  TestLogin
//
//  Created by fadel sultan on 11/15/17.
//  Copyright © 2017 fadel sultan. All rights reserved.
//

import UIKit

class Welcome: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if UserDefaults.standard.string(forKey: "User") == nil {
            handlePresentSignInViewController()
        }
    }
    
    @IBAction func signOut(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "User")
        UserDefaults.standard.synchronize()
        handlePresentSignInViewController()
    }
    
    func handlePresentSignInViewController() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignIn")
        self.present(vc!, animated: true, completion: nil)
    }
}

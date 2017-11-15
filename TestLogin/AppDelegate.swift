//
//  AppDelegate.swift
//  TestLogin
//
//  Created by fadel sultan on 11/15/17.
//  Copyright © 2017 fadel sultan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Enter to background")
        
        NotificationCenter.default.addObserver(self, selector: #selector(timeToKillSession), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
        
        
    }
    
    var timerToKillSession: Timer?

    @objc func timeToKillSession(){
       timerToKillSession = Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(startTimerToKillSession), userInfo: nil, repeats: false)
    }
    
    @objc func startTimerToKillSession() {
        print("Session is Killed")
        window?.rootViewController?.dismiss(animated: true, completion: nil)
        UserDefaults.standard.removeObject(forKey: "User")
        UserDefaults.standard.synchronize()
        let SB = UIStoryboard(name: "Main", bundle: nil)
        let vc = SB.instantiateViewController(withIdentifier: "SignIn")
        window?.rootViewController?.present(vc, animated: true, completion: nil)
        timerToKillSession?.invalidate()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        if timerToKillSession != nil  {
            timerToKillSession?.invalidate()
            print("Timer is Stop")
        }
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


//
//  AppDelegate.swift
//  UIKitTest
//
//  Created by Development on 19/4/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        let root = UINavigationController(rootViewController: HomeViewController())
        window?.rootViewController = root
       
        
          
       
        return true
    }

    

}


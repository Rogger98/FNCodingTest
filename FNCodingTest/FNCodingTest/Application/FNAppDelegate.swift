//
//  FNAppDelegate.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import UIKit

class FNAppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    var appCordinator: FNFlowCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window =  UIWindow(frame: UIScreen.main.bounds)
        appCordinator = FNFlowCoordinator(window: window, dependencyProvider: ApplicationComponentsFactory())
        FNApplication.setupApp(window: window,appCordinator: appCordinator)
        self.window = window
        self.window?.makeKeyAndVisible()
        return true
    }

  
}


//
//  FakeFNAppDelegate.swift
//  FNCodingTestTests
//
//  Created by psagc on 23/03/22.
//

import UIKit

class FakeFNAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

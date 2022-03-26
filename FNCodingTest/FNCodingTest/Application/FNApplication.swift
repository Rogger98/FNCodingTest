//
//  FNApplication.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import UIKit

/// `FNApplication` takes responsibility about setup library and intial setups of application.
class FNApplication {
    
    /// setup All library and routing stuff
    class func setupApp(window: UIWindow,appCordinator: FNFlowCoordinator) {
        appCordinator.start()
    }
}

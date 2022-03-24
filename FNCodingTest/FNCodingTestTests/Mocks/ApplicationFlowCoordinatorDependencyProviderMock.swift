//
//  ApplicationFlowCoordinatorDependencyProviderMock.swift
//  FNCodingTestTests
//
//  Created by psagc on 24/03/22.
//

import UIKit
import XCTest
@testable import FNCodingTest

class ApplicationFlowCoordinatorDependencyProviderMock: ApplicationFlowCoordinatorDependencyProvider {
    
    
    var vehiclesNavigationController: UINavigationController?
    
    func vehiclesNavigationController(navigator: VehiclesNavigatorType) -> UINavigationController {
        vehiclesNavigationController!
    }
    func vehiclesDetails(_ vehicles: [PoiList]) -> UIViewController {
        UIViewController()
    }
    
}

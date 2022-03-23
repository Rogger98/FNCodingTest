//
//  VehiclesFlowCordinator.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import UIKit

/// The `VehiclesFlowCordinator` takes control over the flows on the movies search screen
class VehiclesFlowCordinator: FlowCoordinator {
    fileprivate let window: UIWindow
    fileprivate var searchNavigationController: UINavigationController?
    fileprivate let dependencyProvider: VehiclesFlowCoordinatorDependencyProvider

    init(window: UIWindow, dependencyProvider: VehiclesFlowCoordinatorDependencyProvider) {
        self.window = window
        self.dependencyProvider = dependencyProvider
    }

    func start() {
        let searchNavigationController = dependencyProvider.vehiclesNavigationController(navigator: self)
        window.rootViewController = searchNavigationController
        self.searchNavigationController = searchNavigationController
    }
}

extension VehiclesFlowCordinator: VehiclesNavigator {
    func showDetails(forVehicle vehicles: [PoiList]) {
        
    }

}

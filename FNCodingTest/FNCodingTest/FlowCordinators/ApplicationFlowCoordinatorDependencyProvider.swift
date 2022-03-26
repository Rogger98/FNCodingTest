//
//  ApplicationFlowCoordinatorDependencyProvider.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import Foundation
import UIKit

/// The `ApplicationFlowCoordinatorDependencyProvider` protocol defines methods to satisfy external dependencies of the ApplicationFlowCoordinator
protocol ApplicationFlowCoordinatorDependencyProvider: VehiclesFlowCoordinatorDependencyProvider {}

protocol VehiclesFlowCoordinatorDependencyProvider: class {
    /// Creates UIViewController to show vehicle Listing
    func vehiclesNavigationController(navigator: VehiclesNavigatorType) -> UINavigationController

    // Creates UIViewController to show the details of the poi.
    func vehiclesDetails(_ vehicles: [PoiList]) -> UIViewController
}

//
//  FNFlowCordinator.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import Foundation
import UIKit

/// The application flow coordinator. Takes responsibility about coordinating view controllers and driving the flow
class FNFlowCoordinator: FlowCoordinator {

    typealias DependencyProvider = ApplicationFlowCoordinatorDependencyProvider

    private let window: UIWindow
    private let dependencyProvider: DependencyProvider
    private var childCoordinators = [FlowCoordinator]()

    init(window: UIWindow, dependencyProvider: DependencyProvider) {
        self.window = window
        self.dependencyProvider = dependencyProvider
    }

    /// Creates all necessary dependencies and starts the flow
    func start() {
        let searchFlowCoordinator = VehiclesFlowCordinator(window: window, dependencyProvider: self.dependencyProvider)
        searchFlowCoordinator.start()
    }

}

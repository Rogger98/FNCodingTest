//
//  FNComponentsFactory.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import Foundation
import UIKit
/// The ApplicationComponentsFactory takes responsibity of creating application components and establishing dependencies between them.
final class ApplicationComponentsFactory {
    fileprivate var servicesProvider: VehicleListAPIProtocol


    init(servicesProvider: VehicleListAPIProtocol = VehiclesListAPI()) {
        self.servicesProvider = servicesProvider
    }
}

extension ApplicationComponentsFactory: ApplicationFlowCoordinatorDependencyProvider {
    func vehiclesNavigationController(navigator: VehiclesNavigatorType) -> UINavigationController {
        let viewModel = VehicleListViewModel(vehicleServiceType: servicesProvider,navigator: navigator)
        let moviesSearchViewController = VehiclesViewController(viewModel: viewModel)
        let moviesSearchNavigationController = UINavigationController(rootViewController: moviesSearchViewController)
        moviesSearchNavigationController.navigationBar.tintColor = .label
        return moviesSearchNavigationController
    }
    
    func vehiclesDetails(_ vehicles: [PoiList]) -> UIViewController {
        return UIViewController()
    }
}

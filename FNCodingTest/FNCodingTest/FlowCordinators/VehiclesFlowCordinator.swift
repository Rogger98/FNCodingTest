//
//  VehiclesFlowCordinator.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import UIKit
import CoreLocation

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

extension VehiclesFlowCordinator: VehiclesNavigatorType {
    func showDetails(forVehicle vehicles: [PoiList]) {
        
        
//        let data = vehicles.compactMap({POI($0.id?.stringValue ?? "",poiState: $0.state?.stringValue ?? "",poiType: $0.type?.stringValue ?? "",poiHeading: $0.heading?.stringValue ?? "",poiLocation:POILocation($0.coordinate?.latitude?.stringValue ?? "", longtitude: $0.coordinate?.longitude?.stringValue ?? ""))})
        
        let data = vehicles.compactMap { (item) -> POI in
            let location = CLLocationCoordinate2D(latitude: item.coordinate?.latitude?.doubleValue ?? 0.0, longitude: item.coordinate?.longitude?.doubleValue ?? 0.0)
            let poi = POI(item.id?.stringValue ?? "",poiState: item.state?.stringValue ?? "",poiType: item.type?.stringValue ?? "",poiHeading: item.heading?.stringValue ?? "",poiLocation: location)
            return poi
        }
        let mapController = MapViewController(data)
        searchNavigationController?.pushViewController(mapController, animated: true)
    }

}

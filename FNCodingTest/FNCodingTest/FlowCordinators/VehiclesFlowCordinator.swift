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
    fileprivate var vehicleNavigationController: UINavigationController?
    fileprivate let dependencyProvider: VehiclesFlowCoordinatorDependencyProvider
    
    init(window: UIWindow, dependencyProvider: VehiclesFlowCoordinatorDependencyProvider) {
        self.window = window
        self.dependencyProvider = dependencyProvider
    }
    
    func start() {
        let searchNavigationController = dependencyProvider.vehiclesNavigationController(navigator: self)
        window.rootViewController = searchNavigationController
        self.vehicleNavigationController = searchNavigationController
    }
}

extension VehiclesFlowCordinator: VehiclesNavigatorType {
    
    func showDetails(forVehicle vehicles: [PoiList],selectedVehicle: PoiList) {
        
        let selected = POI(selectedVehicle.id?.stringValue ?? "", poiState: selectedVehicle.state?.stringValue ?? "", poiType: selectedVehicle.type?.stringValue ?? "", poiHeading: selectedVehicle.heading?.stringValue ?? "", poiLocation: CLLocationCoordinate2D(latitude: selectedVehicle.coordinate?.latitude?.doubleValue ?? 0.0, longitude: selectedVehicle.coordinate?.longitude?.doubleValue ?? 0.0))
        
        let data = vehicles.compactMap { (item) -> POI in
            let location = CLLocationCoordinate2D(latitude: item.coordinate?.latitude?.doubleValue ?? 0.0, longitude: item.coordinate?.longitude?.doubleValue ?? 0.0)
            let poi = POI(item.id?.stringValue ?? "",poiState: item.state?.stringValue ?? "",poiType: item.type?.stringValue ?? "",poiHeading: item.heading?.stringValue ?? "",poiLocation: location)
            return poi
        }
        
        let mapController = MapViewController(data,screenTitle: StringConstants.MapScreen.screenTitle.localized, selectedPOI: selected)
        mapController.navigationItem.title = ""
        mapController.selectedVehicle = { selectedPoi in
            let message = "Message displayed from swift code Selected POI \(selectedPoi.description)"
            self.vehicleNavigationController?.showAlertWith(messsage: message , theam: .appName)
        }
        vehicleNavigationController?.pushViewController(mapController, animated: true)
        
    }
    
}

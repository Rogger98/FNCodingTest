//
//  VehiclesServicesMock.swift
//  FNCodingTestTests
//
//  Created by psagc on 23/03/22.
//

import Foundation
import RxSwift
import RxRelay
import UIKit
import XCTest
@testable import FNCodingTest

class VehiclesServicesMock : VehicleListAPIProtocol {
    
    var vehiclesFetchCount: Int = 0
    func getVehicles(p1: Location, p2: Location, complition: @escaping ([PoiList]) -> Void) {
        
        print("test")
        vehiclesFetchCount += 1
        let data = POIResponse.loadFromFile("PoiService.json")
        complition(data.poiList ?? [])
    }
}

class ApplicationFlowCoordinatorDependencyProviderMock: ApplicationFlowCoordinatorDependencyProvider {
    
    
    var vehiclesNavigationController: UINavigationController?
    
    func vehiclesNavigationController(navigator: VehiclesNavigator) -> UINavigationController {
        vehiclesNavigationController!
    }
    
    func vehiclesDetails(_ vehicles: [PoiList]) -> UIViewController {
        UIViewController()
    }
    
}

struct VehiclesListViewModleMock : VehicleListViewModelType {
    
    var vehicleList: BehaviorSubject<[PoiList]> = BehaviorSubject<[PoiList]>(value: [])
    
    func getAllVehicles(p1: Location, p2: Location) {
        let vehicles = POIResponse.loadFromFile("PoiService.json")
        self.vehicleList.onNext(vehicles.poiList ?? [])
    }
    
    
}
class VehiclesListNavigatorMock: VehiclesNavigator {

    //MARK: - showDetails

    var showDetailsForVehicles = 0
    func showDetails(forVehicle vehicles: [PoiList]) {
        showDetailsForVehicles += 1
    }



}

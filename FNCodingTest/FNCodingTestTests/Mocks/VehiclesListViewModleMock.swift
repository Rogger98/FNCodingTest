//
//  VehiclesListViewModleMock.swift
//  FNCodingTestTests
//
//  Created by psagc on 24/03/22.
//

import Foundation
import XCTest
import RxSwift
@testable import FNCodingTest

struct VehiclesListViewModleMock : VehicleListViewModelType {
    var navigator: VehiclesNavigatorType
    var viewState: BehaviorSubject<VehicleListViewState> = BehaviorSubject<VehicleListViewState>(value: .appear)
    var vehicleList: BehaviorSubject<[PoiList]> = BehaviorSubject<[PoiList]>(value: [])
    
    let vehiclesService:VehiclesServicesMock
    
    init(vehiclesService: VehiclesServicesMock, navigator: VehiclesNavigatorType) {
        self.vehiclesService = vehiclesService
        self.navigator = navigator
    }
    func getAllVehicles(p1: Location, p2: Location) {
        viewState.onNext(.appear)
        self.vehiclesService.getVehicles(p1: p1, p2: p2) { (result) in
            switch result {
            case .success(let pois):
                self.vehicleList.onNext(pois)
                viewState.onNext(.success(!pois.isEmpty))
            case .error(let error):
                viewState.onNext(.error(error))
                
            }
        }
    }
    
    
}

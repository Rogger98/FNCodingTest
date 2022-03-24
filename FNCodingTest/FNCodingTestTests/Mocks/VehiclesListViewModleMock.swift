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
    
    var viewState: BehaviorSubject<VehicleListViewState> = BehaviorSubject<VehicleListViewState>(value: .appear)
    var vehicleList: BehaviorSubject<[PoiList]> = BehaviorSubject<[PoiList]>(value: [])
    
    let vehiclesService:VehiclesServicesMock
    
    init(vehiclesService: VehiclesServicesMock) {
        self.vehiclesService = vehiclesService
    }
    func getAllVehicles(p1: Location, p2: Location) {
        viewState.onNext(.appear)
        self.vehiclesService.getVehicles(p1: p1, p2: p2) { (list) in
            viewState.onNext(.success)
            self.vehicleList.onNext(list)
        }
    }
    
    
}

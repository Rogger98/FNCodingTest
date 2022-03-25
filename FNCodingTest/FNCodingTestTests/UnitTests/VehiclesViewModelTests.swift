//
//  VehiclesViewModelTests.swift
//  FNCodingTestTests
//
//  Created by psagc on 23/03/22.
//

import Foundation
import XCTest
import RxSwift
import RxRelay
@testable import FNCodingTest


class VehiclesViewModelTests: FNTestCase {
    
    private var viewModel: VehiclesListViewModleMock!
    let dislposeBeg: DisposeBag = DisposeBag()
    override func setUp() {
        viewModel = VehiclesListViewModleMock(vehiclesService: vehicleService, navigator: VehiclesListNavigatorMock())
    }
    
    func test_loadData() {
        let expectation = self.expectation(description: "vehicles")
        var vehiclesCount: Int = 0
        viewModel.getAllVehicles(p1: Location(lat: 53.394655, lon: 9.757589), p2: Location(lat: 53.694865, lon: 10.099891))
        viewModel.vehicleList.subscribe { (list) in
            vehiclesCount = list.count
            expectation.fulfill()
        } onError: { (error) in
            expectation.fulfill()
        }.disposed(by: dislposeBeg)

        self.waitForExpectations(timeout: 1.0, handler: nil)
        if vehiclesCount == 0{
            XCTFail()
        }        
    }
}

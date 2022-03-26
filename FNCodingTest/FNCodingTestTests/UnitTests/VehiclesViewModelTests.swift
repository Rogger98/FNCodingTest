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
    
    func test_aaloadData() {
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
            print(" ❌ Test Failed No Vehicles Found ")
            XCTFail()
        }
        print(" 🐒 Test Successed for vehicles ")
    }
    
    func test_activeVehicles() {
        
        
        let expectation = self.expectation(description: "vehicles")
        var activeVehiclesCount: Int = 0
        viewModel.getAllVehicles(p1: Location(lat: 53.394655, lon: 9.757589), p2: Location(lat: 53.694865, lon: 10.099891))
        viewModel.vehicleList.subscribe { (list) in
            activeVehiclesCount = list.filter({$0.poiState == .active}).count
            expectation.fulfill()
        } onError: { (error) in
            expectation.fulfill()
        }.disposed(by: dislposeBeg)

        self.waitForExpectations(timeout: 1.0, handler: nil)
        
        if activeVehiclesCount == 0{
            print(" ❌ Test Failed No Active Vehicles Found ")
            XCTFail()
        } else {
            print(" 🐒 Test Successed for active vehicles ")
        }
        
    }
}

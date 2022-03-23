//
//  VehiclesViewModelTests.swift
//  FNCodingTestTests
//
//  Created by psagc on 23/03/22.
//

import Foundation
import XCTest
import RxRelay
@testable import FNCodingTest


class VehiclesViewModelTests: XCTestCase {
    
    private var viewModel: VehiclesListViewModleMock!
    
    override func setUp() {
        viewModel = VehiclesListViewModleMock()
    }
    
    func test_loadData() {
        viewModel.getAllVehicles(p1: Location(lat: 53.394655, lon: 9.757589), p2: Location(lat: 53.694865, lon: 10.099891))        
    }
}

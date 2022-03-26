//
//  VehiclesListNavigatorMock.swift
//  FNCodingTestTests
//
//  Created by psagc on 24/03/22.
//

import Foundation
import XCTest
@testable import FNCodingTest

class VehiclesListNavigatorMock: VehiclesNavigatorType {
    
    var showDetailsForVehicles = 0

    //MARK: - showDetails
    func showDetails(forVehicle vehicles: [PoiList], selectedVehicle: PoiList) {
        showDetailsForVehicles += 1
    }
}

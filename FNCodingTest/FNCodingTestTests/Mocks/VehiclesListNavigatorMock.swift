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

    //MARK: - showDetails

    var showDetailsForVehicles = 0
    func showDetails(forVehicle vehicles: [PoiList]) {
        showDetailsForVehicles += 1
    }
}

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
    
    func getVehicles(p1: Location, p2: Location, complition: @escaping (APIResult<[PoiList]>) -> Void) {
        print("Moke API Call and responding Data from json")
        vehiclesFetchCount += 1
        let data = POIResponse.loadFromFile("PoiService.json")
        complition(.success(data.poiList ?? []))
        
    }
}



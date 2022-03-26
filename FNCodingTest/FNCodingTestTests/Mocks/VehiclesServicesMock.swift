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
    
    var dataLoadingFail: Bool = false
    
    var dataLoading: Bool = false
    
    func getVehicles(p1: Location, p2: Location, complition: @escaping (APIResult<[PoiList]>) -> Void) {
        print("Moke API Call and responding Data from json")
        vehiclesFetchCount += 1
        let data = POIResponse.loadFromFile("PoiService.json")
        
        if dataLoading {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                complition(.success(data.poiList ?? []))
            }
        } else if dataLoadingFail {
            complition(.success([]))
        } else {
            complition(.success(data.poiList ?? []))
        }
        
        
        
    }
}



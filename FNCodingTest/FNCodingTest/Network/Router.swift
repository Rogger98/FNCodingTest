//
//  Router.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import Foundation
import Alamofire

/// The `APIRouter` protocol defines webservices to confirm the protocal for calling webservice.
protocol APIRouter {
    var path: String { get  }
    var methodType : HTTPMethod { get }
}


// All Web services will be added

enum Router : APIRouter {
    case getVehicles(p1: Location, p2: Location)
}

// MARK: - Setup Path for all Webservices
extension Router {
    
    var path: String {
        switch self {
        case .getVehicles(let p1, let p2):
            return Environment.urlFor(.poiService) + "p1Lat=\(p1.lat)&p1Lon=\(p1.lon)&p2Lat=\(p2.lat)&p2Lon=\(p2.lon)"
        }
    }
}

// MARK: - Setup Method Type
extension Router {
    var methodType: HTTPMethod {
        switch self {
        case .getVehicles:
            return .get
        }        
    }
}

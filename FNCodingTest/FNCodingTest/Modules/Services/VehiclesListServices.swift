//
//  VehiclesListServices.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import Foundation

protocol VehicleListAPIProtocol : AnyObject {
    func getVehicles(p1: Location, p2: Location,complition: @escaping(_ data: [PoiList]) -> Void)
}


final class VehiclesListAPI : VehicleListAPIProtocol {
    func getVehicles(p1: Location, p2: Location, complition: @escaping ([PoiList]) -> Void) {
        WebServics.shared.makeRequest(type: POIResponse.self, router: .getVehicles(p1: p1, p2: p2)) { (result) in
            switch result {
            case .success(let data):
                complition(data.poiList ?? [])
            case .error(let error):
                print(error)
            }
        }
    }
}

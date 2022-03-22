//
//  VehicleListViewModel.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import Foundation
import Combine

protocol VehicleListViewModelType {
    
    func getAllVehicles(p1: Location,p2:Location,complition: @escaping(_ data: [PoiList]) -> Void)
}


struct VehicleListViewModel: VehicleListViewModelType {
    
    let vehicleServiceType: VehicleListAPIProtocol
    
    init(vehicleServiceType: VehicleListAPIProtocol) {
        self.vehicleServiceType = vehicleServiceType
    }
    
    func getAllVehicles(p1: Location, p2: Location,complition: @escaping(_ data: [PoiList]) -> Void) {
        vehicleServiceType.getVehicles(p1: p1, p2: p2, complition: complition)
    }
}

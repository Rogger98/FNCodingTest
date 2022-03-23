//
//  VehicleListViewModel.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import Foundation
import RxSwift
import RxRelay

protocol VehicleListViewModelType {
    var vehicleList : BehaviorSubject<[PoiList]> { get set }
    func getAllVehicles(p1: Location,p2:Location)
}


struct VehicleListViewModel: VehicleListViewModelType {
    var vehicleList: BehaviorSubject<[PoiList]> = BehaviorSubject<[PoiList]>(value: [])
    
    
    let vehicleServiceType: VehicleListAPIProtocol
    
    init(vehicleServiceType: VehicleListAPIProtocol,navigator: VehiclesNavigator) {
        self.vehicleServiceType = vehicleServiceType
    }
    
    func getAllVehicles(p1: Location, p2: Location) {
        vehicleServiceType.getVehicles(p1: p1, p2: p2) { (list) in
            self.vehicleList.onNext(list)
        }
    }
    
  
}

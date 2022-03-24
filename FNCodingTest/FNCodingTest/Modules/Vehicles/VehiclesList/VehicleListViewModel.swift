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
    var viewState: BehaviorSubject<VehicleListViewState> { get set }
    func getAllVehicles(p1: Location,p2:Location)
}

enum VehicleListViewState {
    case loading
    case success
    case error(String)
    case appear
}
struct VehicleListViewModel: VehicleListViewModelType {
    var viewState: BehaviorSubject<VehicleListViewState> = BehaviorSubject<VehicleListViewState>(value: .appear)
    
    var vehicleList: BehaviorSubject<[PoiList]> = BehaviorSubject<[PoiList]>(value: [])
    
    
    let vehicleServiceType: VehicleListAPIProtocol
    
    init(vehicleServiceType: VehicleListAPIProtocol,navigator: VehiclesNavigatorType) {
        self.vehicleServiceType = vehicleServiceType
    }
    
    func getAllVehicles(p1: Location, p2: Location) {
        viewState.onNext(.loading)
        vehicleServiceType.getVehicles(p1: p1, p2: p2) { (list) in
            self.vehicleList.onNext(list)
            viewState.onNext(.success)
        }
    }
    
  
}

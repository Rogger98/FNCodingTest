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
    var navigator: VehiclesNavigatorType { get set }
    func getAllVehicles(p1: Location,p2:Location)
}

enum VehicleListViewState {
    case loading
    case success(Bool)
    case error(WebError)
    case appear
}
struct VehicleListViewModel: VehicleListViewModelType {

    var viewState: BehaviorSubject<VehicleListViewState> = BehaviorSubject<VehicleListViewState>(value: .appear)
    var vehicleList: BehaviorSubject<[PoiList]> = BehaviorSubject<[PoiList]>(value: [])
    
    var navigator: VehiclesNavigatorType
    let vehicleServiceType: VehicleListAPIProtocol
    
    init(vehicleServiceType: VehicleListAPIProtocol,navigator: VehiclesNavigatorType) {
        self.vehicleServiceType = vehicleServiceType
        self.navigator = navigator
    }
    
    func getAllVehicles(p1: Location, p2: Location) {
        viewState.onNext(.loading)
        vehicleServiceType.getVehicles(p1: p1, p2: p2) { (result) in
            
            switch result {
            case .success(let pois):
                self.vehicleList.onNext(pois)
                viewState.onNext(.success(!pois.isEmpty))
            case .error(let error):
                viewState.onNext(.error(error))
                
            }
        }
    }
    
  
}

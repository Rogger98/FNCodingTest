//
//  VehiclesNavigator.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import Foundation


protocol VehiclesNavigator: AutoMockable, AnyObject {
    /// Presents the vehicles details screen
    func showDetails(forVehicle vehicles: [PoiList])
}

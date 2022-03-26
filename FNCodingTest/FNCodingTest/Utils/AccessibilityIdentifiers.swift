//
//  AccessibilityIdentifiers.swift
//  FNCodingTest
//
//  Created by psagc on 24/03/22.
//

import Foundation

public struct AccessibilityIdentifiers {
    
    public struct VehicleList {
        public static let rootViewId = "\(VehicleList.self).rootViewId"
        public static let tableViewId = "\(VehicleList.self).tableViewId"
        public static let cellId = "\(VehicleList.self).cellId"
        public static let refreshButton = "\(VehicleList.self).refreshButton"
    }
    
    public struct MessageView {
        public static let messageViewId = "\(MessageView.self).messageViewId"
    }
    
    public struct LoadingView {
        public static let loadinViewId = "\(LoadingView.self).loadinViewId"
    }
}

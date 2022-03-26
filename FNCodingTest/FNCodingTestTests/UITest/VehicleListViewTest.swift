//
//  VehicleListViewTest.swift
//  FNCodingTestTests
//
//  Created by psagc on 23/03/22.
//

import Foundation
import XCTest
import EarlGrey
@testable import FNCodingTest

class VehicleListViewTest: FNTestCase {
    
    let vehiclesNavigator = VehiclesListNavigatorMock()
    
    
    func test_dataLoadingMessage() {
        
        // GIVEN
        vehicleService.dataLoading = true
        
        // WHEN
        open(viewController: factory.vehiclesNavigationController(navigator: vehiclesNavigator))
        
        // THAN
        vehicleService.dataLoading = false
    }
    
    func test_intialState() {
        
        // GIVEN
        open(viewController: factory.vehiclesNavigationController(navigator: vehiclesNavigator))
        
        // WHEN
        Page.on(VehiclesListPage.self)
            .assertScreenTitle(StringConstants.VehicleScreen.screenTitle.localized)
        
        
    }
    
    func test_vehiclesCount() {
        
        // GIVEN
        let pois = POIResponse.loadFromFile("PoiService.json")
        open(viewController: factory.vehiclesNavigationController(navigator: vehiclesNavigator))
        
        // WHEN
        Page.on(VehiclesListPage.self).assertVehiclesCount(pois.poiList?.count ?? 0)
        
    }
    
    func test_showError_whenDataLoadingFailed() {
       
        // GIVEN
        vehicleService.dataLoadingFail = true
        
        // WHEN
        open(viewController: factory.vehiclesNavigationController(navigator: vehiclesNavigator))
        
        // THAN
        Page.on(VehiclesListPage.self).assertVisible(AccessibilityIdentifiers.MessageView.messageViewId)
    }
    

}

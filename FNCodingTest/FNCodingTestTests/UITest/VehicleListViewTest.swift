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
    
        
    func test_intialState() {
        // GIVEN /WHEN
        open(viewController: factory.vehiclesNavigationController(navigator: vehiclesNavigator))
        
        Page.on(VehiclesListPage.self)
            .assertScreenTitle(StringConstants.VehicleScreen.screenTitle.localized)
        
    }
    
  
    func test_vehiclesCount() {
        
        
        
    }
    
    func test_showError_whenDataLoadingFailed() {
       
    }
    
    func test_onMap_whenTapOnItem() {
       
    }

}

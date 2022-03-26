//
//  VehiclesListPage.swift
//  FNCodingTestTests
//
//  Created by psagc on 24/03/22.
//

import Foundation
import XCTest
import EarlGrey
@testable import FNCodingTest

class VehiclesListPage: Page {
    
    override func verify() {
        assertExists(AccessibilityIdentifiers.VehicleList.rootViewId)
    }
}
// MARK: Actions
extension VehiclesListPage {
    
    @discardableResult
    func tapCell(at index: Int) -> Self {
        return performTap(withId: "\(AccessibilityIdentifiers.VehicleList.cellId).\(index)")
    }
}

// MARK: Assertions
extension VehiclesListPage {
    
    @discardableResult
    func assertScreenTitle(_ text: String) -> Self {
        EarlGrey.selectElement(with: grey_text(text)).assert(grey_sufficientlyVisible())
        return self
    }
    
    @discardableResult
    func assertContentIsHidden() -> Self {
        return assertHidden(AccessibilityIdentifiers.VehicleList.tableViewId)
    }
    
    @discardableResult
    func assertVehiclesCount(_ rowsCount: Int) -> Self {
        EarlGrey.selectElement(with: grey_accessibilityID(AccessibilityIdentifiers.VehicleList.tableViewId))
            .assert(createTableViewRowsAssert(rowsCount: rowsCount, inSection: 0))
        return self
    }

    private func createTableViewRowsAssert(rowsCount: Int, inSection section: Int) -> GREYAssertion {
        return GREYAssertionBlock(name: "TableViewRowsAssert") { (element, error) -> Bool in
            guard let tableView = element as? UITableView, tableView.numberOfSections > section else {
                return false
            }
            let numberOfCells = tableView.numberOfRows(inSection: section)
            return numberOfCells == rowsCount
        }
    }
}

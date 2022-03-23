//
//  FNTestCase.swift
//  FNCodingTestTests
//
//  Created by psagc on 23/03/22.
//

import Foundation
import XCTest
import EarlGrey
@testable import FNCodingTest

class FNTestCase: XCTestCase {
    
    
    var vehicleService = VehiclesServicesMock()
    lazy var factory = ApplicationComponentsFactory(servicesProvider: vehicleService)
    
   

    override func setUp() {
        
    }
    
    
    
    struct OpenViewControllerFlags: OptionSet {
        let rawValue: Int
        
        static let presentModally = OpenViewControllerFlags(rawValue: 1 << 0)
        static let embedInNavigation = OpenViewControllerFlags(rawValue: 1 << 1)
        static let all: OpenViewControllerFlags = [.presentModally, .embedInNavigation]
    }
    
    func open(viewController: UIViewController, flags: OpenViewControllerFlags = .presentModally) {
        let viewControllerToOpen = flags.contains(.embedInNavigation) ? UINavigationController(rootViewController: viewController) : viewController
        viewControllerToOpen.modalPresentationStyle = .fullScreen
        let window = (UIApplication.shared.delegate as! FakeFNAppDelegate).window!
        
        if flags.contains(.presentModally) {
            window.rootViewController = UIViewController()
            window.rootViewController?.present(viewControllerToOpen, animated: false, completion: nil)
        } else {
            window.rootViewController = viewControllerToOpen
        }
    }
}

extension Decodable {
    static func loadFromFile(_ filename: String) -> Self {
        do {
            let path = Bundle(for: EarlGrey.self).path(forResource: filename, ofType: nil)!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode(Self.self, from: data)
        } catch {
            fatalError("Error: \(error)")
        }
    }
}

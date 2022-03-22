//
//  UIStoryboard+Extention.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import UIKit

enum FNStoryboards : String {
    case vehicles
    
    var name: String {
        return rawValue
    }
}
extension UIStoryboard {
    
    static var vehiclesStoryboard: UIStoryboard {
        UIStoryboard(name: FNStoryboards.vehicles.name, bundle: nil)
    }
    
    func getViewController<T: UIViewController>(_ type: T.Type) -> T? {
        let identifier = String(describing: type)
        return instantiateViewController(withIdentifier: identifier) as? T
    }
}



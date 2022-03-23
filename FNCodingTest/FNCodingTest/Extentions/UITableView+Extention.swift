//
//  UITableView+Extention.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import UIKit

extension UITableView {
    
//    func registerCell<T: UITableViewCell>(_ cell: T.Type) -> T? {
//        let identifier = String(describing: cell)
//        if let cell = dequeueReusableCell(withIdentifier: identifier) as? T{
//            return cell
//        }
//        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
//        return registerCell(cell)
//    }
    
    func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        let identifier = String(describing: cell)
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
}

extension UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
}

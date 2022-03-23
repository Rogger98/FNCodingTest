//
//  UITableView+Extention.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import UIKit

extension UITableView {
    
    /// register cell to your tableView
    func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        let identifier = String(describing: cell)
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
}

extension UITableViewCell {
    
    /// default cell identifier
    static var identifier: String {
        String(describing: self)
    }
}

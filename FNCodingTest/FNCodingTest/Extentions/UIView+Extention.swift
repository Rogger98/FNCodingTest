//
//  UIView+Extention.swift
//  FNCodingTest
//
//  Created by psagc on 24/03/22.
//

import UIKit

extension UIView {
    func addAndFillSuperview(_ superview: UIView, margins: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [topAnchor.constraint(equalTo: superview.topAnchor, constant: margins.top),
                           bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -margins.bottom),
                           leftAnchor.constraint(equalTo: superview.leftAnchor, constant: margins.left),
                           rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -margins.right)]

        superview.addSubview(self)

        NSLayoutConstraint.activate(constraints)
    }
    
    func addAndFillSuperviewInFirstPostistion(_ superview: UIView, margins: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [topAnchor.constraint(equalTo: superview.topAnchor, constant: margins.top),
                           bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -margins.bottom),
                           leftAnchor.constraint(equalTo: superview.leftAnchor, constant: margins.left),
                           rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -margins.right)]

        superview.insertSubview(self, at: 0)

        NSLayoutConstraint.activate(constraints)
    }
    
    func addAndFillSuperviewWithPickerViewAtBottom(_ superview: UIView, margins: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -margins.bottom),
                           leftAnchor.constraint(equalTo: superview.leftAnchor, constant: margins.left),
                           rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -margins.right),
                           self.heightAnchor.constraint(equalToConstant: 216.0)]
        
        
        superview.addSubview(self)
        
        NSLayoutConstraint.activate(constraints)

    }
    
    func removePickerViewFromSuperView(_ superview: UIView) {
        if superview.subviews.contains(self) {
            self.removeFromSuperview()
        }
    }
}


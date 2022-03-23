//
//  UIImageView+Extention.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import UIKit

extension UIImageView {
    
    func setFNImage(image: FNImages) {
        self.image = UIImage(named: image.rawValue)
    }
}

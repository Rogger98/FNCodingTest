//
//  EmptyMessageView.swift
//  FNCodingTest
//
//  Created by psagc on 25/03/22.
//

import UIKit

class MessageView: NibDefinedView {

    @IBOutlet private weak var lableMessage: UILabel?
    @IBOutlet private weak var lableHeader: UILabel?
    @IBOutlet private weak var imageViewEmpty: UIImageView?
    
    override func xibSetup() {
        super.xibSetup()
    }
    
    func showWith(header: String,message: String, image: FNImages) {
        self.isHidden = false
        self.lableMessage?.text = message
        self.lableHeader?.text = header
        self.imageViewEmpty?.setFNImage(image: image)
    }
    
}

//
//  LoadingView.swift
//  FNCodingTest
//
//  Created by psagc on 24/03/22.
//

import Foundation

class LoadingView: NibDefinedView {
    
    @IBOutlet private weak var lableMessage: UILabel?
    
    override func xibSetup() {
        super.xibSetup()
    }
    
    func setLoadingMessage(message: String) {
        lableMessage?.text = message
    }
}

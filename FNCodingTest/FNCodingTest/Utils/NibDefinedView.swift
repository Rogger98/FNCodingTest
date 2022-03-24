//
//  NibDefinedView.swift
//  FNCodingTest
//
//  Created by psagc on 24/03/22.
//

import UIKit

protocol NibDefinedBaseView: AnyObject {
     var nibName: String { get }
    func xibSetup()
    func connectXib(xibView: UIView)
}

class NibDefinedView: UIView {
    private var contentView: UIView?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }

    func xibSetup() {
        guard let newView = loadViewFromNib() else { return }

        addSubview(newView)
        addConstraints([
            NSLayoutConstraint(item: newView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: newView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: newView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: newView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
            ])

        translatesAutoresizingMaskIntoConstraints = false
        newView.translatesAutoresizingMaskIntoConstraints = false

        connectXib(xibView: newView)
    }

    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}

extension NibDefinedView: NibDefinedBaseView {
    var nibName: String {
        return String(describing: type(of: self))
    }

    func connectXib(xibView: UIView) {
        contentView = xibView
    }
}


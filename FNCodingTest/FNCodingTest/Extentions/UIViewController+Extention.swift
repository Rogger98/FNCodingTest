//
//  UIViewController+Extention.swift
//  FNCodingTest
//
//  Created by psagc on 26/03/22.
//

import UIKit

enum Theam {
    case error
    case success
    case appName
}

extension Theam {
    var title : String {
        switch self {
        case .appName:
            return StringConstants.AlertTitles.appName.localized
        case .error:
            return StringConstants.AlertTitles.error.localized
        case .success:
            return StringConstants.AlertTitles.success.localized
        }
    }
}

extension UIViewController {
    
    func showAlertWith(messsage: String, theam: Theam, actions: UIAlertAction...) {
        let alertController = UIAlertController(title: theam.title, message: messsage, preferredStyle: .alert)
        if actions.isEmpty {
            alertController.addAction(UIAlertAction(title: StringConstants.Common.ok.localized, style: .default, handler: nil))
        } else {
            actions.forEach(alertController.addAction(_:))
        }
        DispatchQueue.dispatchToMainQueueSync {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

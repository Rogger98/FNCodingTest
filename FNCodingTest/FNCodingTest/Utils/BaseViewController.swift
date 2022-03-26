//
//  BaseViewController.swift
//  FNCodingTest
//
//  Created by psagc on 24/03/22.
//

import UIKit
import RxRelay
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {

    var disposeBag: DisposeBag = DisposeBag()
    
    var loadingView: LoadingView = {
        let load = LoadingView()
        return load
    }()
    
    var messageView: MessageView = {
        let empty = MessageView()
        return empty
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUIElements()
    }
    
    func setupUIElements () {
        loadingView.isHidden = true
        loadingView.setLoadingMessage(message: StringConstants.VehicleScreen.loadingMessage.localized)
        loadingView.addAndFillSuperview(view)
        messageView.isHidden = true
        messageView.addAndFillSuperview(view)
    }
    func configure(from viewState: VehicleListViewState) {
        DispatchQueue.dispatchToMainQueueSync {
            switch viewState {
                case.appear:
                    print("Appear")
                case .error(let message):
                    print("Appear \(message)")
                    loadingView.isHidden = true
                    let errorMessage = self.getErrorMessage(error: message)
                    self.messageView.showWith(header: errorMessage.title, message: errorMessage.message, image: errorMessage.image)
                case .success(let data):
                    print("Success")
                    messageView.isHidden = true
                    loadingView.isHidden = true
                    if !data {
                        self.messageView.showWith(header: StringConstants.Common.sorry.localized, message: StringConstants.VehicleScreen.noVehiclesAvailable.localized, image: .location)
                    }
                     
                case .loading:
                    messageView.isHidden = false
                    loadingView.isHidden = false
                    view.bringSubviewToFront(loadingView)
                
            }
        }
    }
    
    private func getErrorMessage(error: WebError) -> (title: String,message: String, image: FNImages){
        switch error {
        case .backendError(let ressponse):
            return (ressponse.error, ressponse.message, .error)
        case .decodingFailed:
            return (StringConstants.Common.serverError.localized, StringConstants.Common.serverError.localized, .error)
        case .networkError(let networkError):
            return (StringConstants.Common.networkIssue.localized , networkError.localizedDescription, .error)
        case .notDataFound:
            return (StringConstants.Common.sorry.localized, StringConstants.Common.somethingWentwrong.localized, .location)
        case .noInternet:
            return (StringConstants.Common.noInternet.localized, StringConstants.Common.noInternetDescription.localized , .location)
        }
    }
}

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUIElements()
    }
    
    func setupUIElements () {
        loadingView.isHidden = true
        loadingView.addAndFillSuperview(view)
    }
    func configure(from viewState: VehicleListViewState) {
        DispatchQueue.dispatchToMainQueueSync {
            switch viewState {
                case.appear:
                    print("Appear")
                case .error(let message):
                    print("Appear \(message)")
                case .success:
                    print("Success")
                    loadingView.isHidden = true
                case .loading:
                    loadingView.isHidden = false
                    view.bringSubviewToFront(loadingView)
                
            }
        }
    }
}

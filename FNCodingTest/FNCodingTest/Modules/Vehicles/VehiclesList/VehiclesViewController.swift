//
//  VehiclesViewController.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import UIKit
import RxSwift
import RxCocoa
import Combine

class VehiclesViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private var tableViewVehicles: UITableView!
    private var refreshButton: UIButton = UIButton(type: .roundedRect)
    var viewModel: VehicleListViewModelType
    var disposeBag: DisposeBag = DisposeBag()
    
    init(viewModel: VehicleListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func prepareView() {
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        title = "VEHICLES"
        let barButton = UIBarButtonItem(systemItem: .refresh)
        self.navigationItem.rightBarButtonItem = barButton
        tableViewVehicles.registerCell(VehicleCell.self)
    }
    
    private func setupBindings() {
        getAllVehicles()
        refreshButton.rx.tap.subscribe(onNext: { [weak self] in
            guard let `self` = self else {
                return
            }
            self.getAllVehicles()
        }).disposed(by: disposeBag)
        
        
        viewModel.vehicleList.bind(to: tableViewVehicles.rx.items(cellIdentifier: VehicleCell.identifier, cellType: VehicleCell.self)) {row, model, cell in
            cell.vehicle = model
        }.disposed(by: disposeBag)
        
    }
}
// MARK: - Data Requesting
extension VehiclesViewController {
    
    func getAllVehicles() {
        viewModel.getAllVehicles(p1: Location(lat: 53.394655, lon: 9.757589), p2: Location(lat: 53.694865, lon: 10.099891))
    }
}

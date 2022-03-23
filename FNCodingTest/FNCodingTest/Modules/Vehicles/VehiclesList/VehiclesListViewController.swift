//
//  VehiclesListViewController.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa
class VehiclesListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private var tableViewVehicles: UITableView!
    private var refreshButton: UIButton = UIButton(type: .roundedRect)
    lazy var viewModel: VehicleListViewModel = VehicleListViewModel(vehicleServiceType: VehiclesListAPI())
    var disposeBag: DisposeBag = DisposeBag()

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
    func getAllVehicles() {
        viewModel.getAllVehicles(p1: Location(lat: 53.394655, lon: 9.757589), p2: Location(lat: 53.694865, lon: 10.099891))
    }
}


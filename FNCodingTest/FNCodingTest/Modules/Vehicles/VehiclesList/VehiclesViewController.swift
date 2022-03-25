//
//  VehiclesViewController.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import UIKit
import RxSwift

class VehiclesViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private var tableViewVehicles: UITableView!
    @IBOutlet private var activityLoader: UIActivityIndicatorView!
    
    private var refreshButton: UIBarButtonItem = UIBarButtonItem(systemItem: .refresh)
    var viewModel: VehicleListViewModelType
    
    
    
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
        view.accessibilityIdentifier = AccessibilityIdentifiers.VehicleList.rootViewId
        tableViewVehicles.accessibilityIdentifier = AccessibilityIdentifiers.VehicleList.tableViewId        
        title = StringConstants.VehicleScreen.vehicle.localized
        self.navigationItem.rightBarButtonItem = refreshButton
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
            cell.accessibilityIdentifier = "\(AccessibilityIdentifiers.VehicleList.cellId).\(row)"
        }.disposed(by: disposeBag)
        
        Observable.zip(tableViewVehicles.rx.itemSelected, tableViewVehicles.rx.modelSelected(PoiList.self))
               .bind { [unowned self] indexPath, model in
            self.tableViewVehicles.deselectRow(at: indexPath, animated: true)
                do {
                    let list = try self.viewModel.vehicleList.value()
                    self.viewModel.navigator.showDetails(forVehicle: list, selectedVehicle: list[indexPath.row])
                } catch {
                    print("Error \(error.localizedDescription)")
                }
        }.disposed(by: disposeBag)

        
        viewModel.viewState.subscribe { [weak self] (state) in
            guard let `self` = self, let viewState = state.element else { return }
            self.configure(from: viewState)
        }.disposed(by: disposeBag)
        
        

    }
}
// MARK: - Data Requesting
extension VehiclesViewController {
    
    func getAllVehicles() {
        viewModel.getAllVehicles(p1: Location(lat: 0, lon: 0), p2: Location(lat: 53.694865, lon: 10.099891))
    }
}

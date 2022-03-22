//
//  VehiclesListViewController.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import UIKit
import Combine
class VehiclesListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private var tableViewVehicles: UITableView?
    @Published var vehicles:[PoiList] = []
    lazy var viewModel: VehicleListViewModel = VehicleListViewModel(vehicleServiceType: VehiclesListAPI())
    var subscriptions = [AnyCancellable]()

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
        setupBindings()
    }
    
    private func setupBindings() {
        viewModel.getAllVehicles(p1: Location(lat: 53.394655, lon: 9.757589), p2: Location(lat: 53.694865, lon: 10.099891), complition: { [weak self] data in
            self?.vehicles.append(contentsOf: data)
        })
        
    }
}


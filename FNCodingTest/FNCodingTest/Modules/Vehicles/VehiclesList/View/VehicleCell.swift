//
//  VehicleCell.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import UIKit

final class VehicleCell: UITableViewCell {

    @IBOutlet private weak var labelVehicleIdentity: UILabel?
    @IBOutlet private weak var labelVehicleType: UILabel?
    @IBOutlet private weak var imageViewVehicle: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var vehicle: PoiList? {
        didSet {
            labelVehicleIdentity?.text = vehicle?.id?.stringValue
            labelVehicleType?.text = vehicle?.type?.stringValue
            imageViewVehicle?.setFNImage(image: .sedan)
        }
    }
    
}

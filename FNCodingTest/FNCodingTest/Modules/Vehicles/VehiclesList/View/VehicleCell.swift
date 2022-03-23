//
//  VehicleCell.swift
//  FNCodingTest
//
//  Created by psagc on 23/03/22.
//

import UIKit

class VehicleCell: UITableViewCell {

    @IBOutlet private weak var labelVehicleIdentity: UILabel?
    @IBOutlet private weak var labelVehicleType: UILabel?
    @IBOutlet private weak var imageViewVehicle: UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var vehicle: PoiList? {
        didSet {
            labelVehicleIdentity?.text = vehicle?.id?.stringValue
            labelVehicleType?.text = vehicle?.type?.stringValue
            imageViewVehicle?.setFNImage(image: .sedan)
        }
    }
    
}

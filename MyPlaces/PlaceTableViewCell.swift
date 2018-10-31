//
//  PlaceTableViewCell.swift
//  MyPlaces
//
//  Created by Grace Toa on 21/10/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var namePlaceLabel: UILabel!
    
    @IBOutlet weak var descriptionPlaceLabel: UILabel!
    
    @IBOutlet weak var imagePlaceLabel: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

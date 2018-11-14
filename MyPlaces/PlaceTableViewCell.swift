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
    
    @IBOutlet weak var backgroundImageView: UIImageView! {
        didSet{
            backgroundImageView.layer.cornerRadius = 20
        }
    }
    
    
    func bind(place: Place){
        
        namePlaceLabel.text = place.name
        descriptionPlaceLabel.text = place.description
        
    }

}

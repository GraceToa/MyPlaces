//
//  PlaceTourist.swift
//  MyPlaces
//
//  Created by Grace Toa on 30/9/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import Foundation

class PlaceTourist: Place {
    
    //MARK: Properties
    var discount_tourist  = ""
    
    override init() {
        super.init()
        self.type = .touristcPlace
    }
    
    //MARK: Initialization
    
    init(name:String,descriptionP:String,discount_tourist:String,image_in:Data?) {
        super.init(type:.touristcPlace,name:name,descriptionP:descriptionP,image_in:image_in)
        self.discount_tourist=discount_tourist
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
}

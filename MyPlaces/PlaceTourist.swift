//
//  PlaceTourist.swift
//  MyPlaces
//
//  Created by Grace Toa on 30/9/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import Foundation

class PlaceTourist: Place {
    
    var discount_tourist  = ""
    
    override init() {
        super.init()
        self.type = .touristcPlace
    }
    
    init(name:String,description:String,discount_tourist:String,image_in:Data?) {
        super.init(type:.touristcPlace,name:name,description:description,image_in:image_in)
        self.discount_tourist=discount_tourist
    }
    
}

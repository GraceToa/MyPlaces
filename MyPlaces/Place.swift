//
//  Place.swift
//  MyPlaces
//
//  Created by Grace Toa on 30/9/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import Foundation
import MapKit


class Place {
    
    enum PlaceTypes{
        case GenericPlace
        case TouristcPlace
    }
    
    var id: String = ""
    var type: PlaceTypes = .GenericPlace
    var name: String = ""
    var description: String = ""
    var location: CLLocationCoordinate2D!
    var image: Data? = nil
    
    
    init(){
    }
    
    init(name:String,description:String,image_in:Data?) {
        self.id=UUID().uuidString
        self.name = name
        self.description = description
        self.image = image_in
    }
    
    init(type:PlaceTypes,name:String,description:String,image_in:Data?) {
        self.id=UUID().uuidString
        self.type = type
        self.name = name
        self.description = description
        self.image = image_in
    }

}



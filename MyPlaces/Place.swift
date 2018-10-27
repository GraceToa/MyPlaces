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
    
    /*enumeración tipo de datos que permiten definir una lista de valores posibles*/
    enum PlaceTypes{
        case genericPlace
        case touristcPlace
    }
    
    //MARK: Properties
    
    var id: String = ""
    var type: PlaceTypes = .genericPlace
    var name: String?
    var description: String?
    var location: CLLocationCoordinate2D!
    var image: Data?
    
    //MARK: Initialization
    
    init(){
        self.id = UUID().uuidString
    }
    
    init(name:String?,description:String?) {
        self.id = UUID().uuidString
        self.name = name
        self.description = description
      
    }
    
    
    init(type:PlaceTypes,name:String,description:String,image_in:Data?) {
        self.id=UUID().uuidString
        self.type = type
        self.name = name
        self.description = description
        self.image = image_in
    }

}



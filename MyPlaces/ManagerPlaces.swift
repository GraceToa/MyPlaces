//
//  ManagerPlaces.swift
//  MyPlaces
//
//  Created by Grace Toa on 30/9/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import Foundation

class ManagerPlaces{
    
    var places = [Place]()
    
    init() {
        
    }
    
    //add place
    func append(_ value: Place)  {
        places.append(value)
    }
    
    //count place
    func GetCount()->Int {
        return places.count;
    }
    
    //find position
    func GetItemAt(position:Int) -> Place {
        let posPlace = places[position]
        return posPlace;
    }
    
    //find element by id
    func GetItemById(id:String)->Place{
        var placeById = Place()
        for place in places  {
            if place.id == id{
                //save the object found
                placeById=place
            }
        }
        return placeById
    }
    
    //remove place into places
    func remove(_ value:Place){
        if let index = places.index(where: {$0.name == value.name}) {
            places.remove(at: index)
        }
    }
    
    
    //******************************************
    // Singleton
    //
    //  Unique instance for all App
    //
    
     static var sharedManagerPlaces: ManagerPlaces = {
        
        var singletonManager:ManagerPlaces
        
        singletonManager = ManagerPlaces()
        
        return singletonManager
    }()
    
    
    
    
}//end class

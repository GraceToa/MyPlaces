//
//  ManagerPlaces.swift
//  MyPlaces
//
//  Created by Grace Toa on 30/9/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import Foundation

/*
 Clase
 */
class ManagerPlaces{
    
    //Patrón Singleton
    static let shared = ManagerPlaces()
    
    private var places = [Place]()
    
    private init() {}
    
    //Inserta un nuevo place en la lista de places
    func append(_ place: Place)  {
        places.append(place)
    }
    
    //Retorna numero de places
    func getCount()->Int {
        return places.count;
    }
    
    /*Return un place especificado por posición, si la posición no existiera en
     la lista el método devuelve nil, para esto usamos un opcional Place? */
    func getItemAt(position:Int) -> Place? {
        //guard nos permite especificar alguna condición que debe cumplirse
        guard position < places.count else {return nil}
        return places[position];
    }
    
    /*Return un place con un id especifico, si el id no existe se controlara con un opcional*/
    func getItemById(_ id: String)->Place?{
        return places.filter{$0.id == id}.first
    }
    
    //Remove un place desde la lista
    func remove(_ place:Place){
        if let index = places.index(where: {$0.name == place.name}) {
            places.remove(at: index)
        }
    }
    
   //Only for demo purposes
    var someTestPlace = [
        Place(name: "UOC 22@",
              description: "Seu de la Universitat Oberta de Catalunya"),
        Place(name: "Rostisseria Lolita",
              description: "Els millors pollastres de Sant Cugat"),
        Place(name: "CIFO L'Hospitalet",
              description: "Seu del Centre d'Innovació i Formació per a l'Ocupació")
       
        
    ]
    
    
    
}//end class

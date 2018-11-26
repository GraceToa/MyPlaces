//
//  ManagerPlaces.swift
//  MyPlaces
//
//  Created by Grace Toa on 30/9/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import MapKit


class ManagerPlaces{
    
    //MARK: Properties
    //Patrón Singleton
    static let shared = ManagerPlaces()
    static let NAME_JSON_FILE = "myPlaces.json"
    private var places = [Place]()
    
    
    //MARK: Private Methods
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
        
        Place(name: "UOC 22@", descriptionP: "Seu de la Universitat Oberta de Catalunya", image_in: nil, location:  CLLocationCoordinate2D(latitude: 41.44, longitude: 2.04)),
        
        Place(name:  "Rostisseria Lolita", descriptionP: "Seu de la Universitat Oberta de Catalunya", image_in: nil, location: CLLocationCoordinate2D(latitude: 41.40, longitude: 2.00)),
        
        Place(name:  "CIFO L'Hospitalet", descriptionP: "Seu del Centre d'Innovació i Formació per a l'Ocupació", image_in: nil, location: CLLocationCoordinate2D(latitude:41.42, longitude:2.01))
        
        
    ]
    
    //MARK:  method helper
    //PLACE  ---> JSON func que recibe un place lo añade al array(places)
    func jsonFromPlaces(place: Place){
        var jsonData: Data!
        let jsonEncoder = JSONEncoder()
        let fileUrlJson = ManagerPlaces.shared.findDocumentDir(file: ManagerPlaces.NAME_JSON_FILE)
        do{
            let places = addPlaceInArray(place: place)
            jsonData = try jsonEncoder.encode(places)
            writeDataInJson(jsonDatafromArray: jsonData, fileUrl: fileUrlJson)
        }catch{
            print(" Error encoding...")
        }
    }

    // JSON --> ARRAY [PLACE]
    //load si ya existe un json en local 
    func dadesLoadJSON( ) {
        let places = ManagerPlaces.shared.placesFromJSON()
        for place in places{
            ManagerPlaces.shared.append(place)
        }
    }
    
    //  json File, se grabe en este los ejemplos de place que se cargan por defecto
    //asi la próxima vez que se carge la app mostrara los place nuevos y los por defecto
    //guardados en este json file
    func dadesLoadJSONFirsTime( ) {
        let places = ManagerPlaces.shared.someTestPlace
        var jsonData: Data!
        let jsonEncoder = JSONEncoder()
        jsonData = try! jsonEncoder.encode(places)
        let pathFileJson = ManagerPlaces.shared.findDocumentDir(file: ManagerPlaces.NAME_JSON_FILE)
        writeDataInJson(jsonDatafromArray: jsonData, fileUrl: pathFileJson)
        for place in places{
            ManagerPlaces.shared.append(place)
        }
    }
    
    //JSON --> ARRAY [PLACE]
    func placesFromJSON() -> [Place] {
        let jsonDecoder = JSONDecoder()
        var places: [Place] = []
        do{
            let pathFileJson = ManagerPlaces.shared.findDocumentDir(file: ManagerPlaces.NAME_JSON_FILE)
            let jsonData = try Data(contentsOf: pathFileJson)
            places = try jsonDecoder.decode([Place].self, from: jsonData)
        }catch{
            print("error JSON ---> Place")
        }
        return places
    }
    
    //escribe en json file en la ruta local
    func writeDataInJson(jsonDatafromArray: Data ,fileUrl: URL)  {
        do{
            try jsonDatafromArray.write(to: fileUrl)
            print("Ok save place in local system")
        }catch{
            print("Failed to write Json data")
        }
    }
    
    //add Place in Places
    func addPlaceInArray(place: Place) -> [Place] {
        var placesUpdateFromJSON:[Place]
        placesUpdateFromJSON = placesFromJSON()
        placesUpdateFromJSON.append(place)
        return placesUpdateFromJSON
    }
    
    // ruta en el local system de la app
    func findDocumentDir(file: String) -> URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let filePaht = documentsURL!.appendingPathComponent(file)
        return filePaht
    }
  
}//end class



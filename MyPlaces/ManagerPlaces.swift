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
    static let NAME_JSON_FILE = "o.json"
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
        
        Place(name: "UOC 22@",
              descriptionP: "Seu de la Universitat Oberta de Catalunya",
              image_in: nil, location:CLLocationCoordinate2D(latitude: 41.44, longitude: 2.04)),
        Place(name: "Rostisseria Lolita",
              descriptionP: "Els millors pollastres de Sant Cugat",
              image_in: nil, location:CLLocationCoordinate2D(latitude: 41.43, longitude: 2.03))
        //        Place(name: "CIFO L'Hospitalet",
        //              description: "Seu del Centre d'Innovació i Formació per a l'Ocupació",
        //              image_in: nil),
        //        PlaceTourist(name: "CosmoCaixa",
        //                     description: "Museu de la Ciència de Barcelona",
        //                     discount_tourist: "50%", image_in: nil),
        //        PlaceTourist(name: "Park Güell",
        //                     description: "Obra d'Antoni Gaudí a Barcelona",
        //                     discount_tourist: "10%", image_in: nil)
        
    ]
    
    //MARK:  method privat
    //PLACE  ---> JSON func que recibe un place lo añade al array(places) retorna
    func jsonFromPlaces(place: Place) -> Data? {
        var jsonData: Data!
        let jsonEncoder = JSONEncoder()
        do{
            //me añade el place al array
            let places = addPlaceInArray(place: place)
            //codifico en json
            jsonData = try jsonEncoder.encode(places)
        }catch{
            print(" Error encoding...")
            return nil
        }
        return jsonData// devuelvo el json
    }
    
    //leemos el json file
    // JSON --> ARRAY [PLACE]
    func dadesLoadJSON( ) {
        let places = ManagerPlaces.shared.placesFromJSON()
        for place in places{
            ManagerPlaces.shared.append(place)
            print(place.location)
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
            //cojo json
            let pathFileJson = ManagerPlaces.shared.findDocumentDir(file: ManagerPlaces.NAME_JSON_FILE)
            //contenido de json
            let jsonData = try Data(contentsOf: pathFileJson)
            places = try jsonDecoder.decode([Place].self, from: jsonData)
            for p in places{
                print(p.name ?? "")
            }
        }catch{
            print("error JSON ---> Place")
        }
        return places
    }
    
    func writeDataInJson(jsonDatafromArray: Data ,fileUrl: URL)  {
        do{
            try jsonDatafromArray.write(to: fileUrl)
            print("Ok save place in local system")
        }catch{
            print("Failed to write Json data")
        }
    }
    
    func addPlaceInArray(place: Place) -> [Place] {
        var placesUpdateFromJSON:[Place]
        placesUpdateFromJSON = placesFromJSON()
        placesUpdateFromJSON.append(place)
        
        return placesUpdateFromJSON
    }
    
    //    func editPlaceInJSON(place:Place) -> [Place] {
    //         var places: [Place]
    //    }
    
    func findDocumentDir(file: String) -> URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let filePaht = documentsURL!.appendingPathComponent(file)
        print(filePaht.path)
        return filePaht
    }
    
 
  
    
}//end class

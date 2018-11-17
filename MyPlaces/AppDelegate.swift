//
//  AppDelegate.swift
//  MyPlaces
//
//  Created by Grace Toa on 26/9/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().barStyle = .blackOpaque
        
        //load examples
        let manager = ManagerPlaces.shared
        
        //check json file exist in local system
        let dadesJson = dades();
        if  (dadesJson != nil){
            let dadesPlace = dadesJson?["places"] as! [[String:Any]]
            for item in dadesPlace{
                let place = Place(name: item["name"] as? String, description: item["description"] as? String, image_in: nil)
                manager.append(place)
            }
        }
        
        for place in manager.someTestPlace{
            manager.append(place)
        }
        
        return true
    }

    //MARK: Method private
    //Función que Comprueba si existe un documento json en sistema local, si es así devuelve un array de objetos
    func dades() ->[String:Any]?{
        do {
            if let file = Bundle.main.url(forResource: "document", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers])
                if let object = json as? [String: Any] {
                    return object
                }
                return nil
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }

  

}


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
        
        UINavigationBar.appearance().barStyle = .blackOpaque
    
        //check json file exist in local system
        let pathFileJson = ManagerPlaces.shared.findDocumentDir(file: "document.json")
        let fileManager = FileManager.default
        var directory: ObjCBool = ObjCBool(false)
        if !fileManager.fileExists(atPath: (pathFileJson.path), isDirectory: &directory) {
            for place in ManagerPlaces.shared.someTestPlace{
                ManagerPlaces.shared.append(place)
            }
        } else {
            print("JSON File Already exists")
            ManagerPlaces.shared.dadesLoadJSON()
        }
        
        return true
    }

    //MARK: Method private


  
}


//
//  MapViewController.swift
//  MyPlaces
//
//  Created by Grace Toa on 24/11/2018.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController,CLLocationManagerDelegate {
    
    //MARK: CLLocationCoordinate2D properties
    let locManager = CLLocationManager()
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    var currentLocation: CLLocation!
    
    //MARK: Outlets
    @IBOutlet weak var map: MKMapView! = nil
    
    //MARK: variables
    var buttonIsHidden: Bool?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        if buttonIsHidden == true {
            self.navigationItem.rightBarButtonItem?.isEnabled = true
            self.navigationItem.leftBarButtonItem?.isEnabled = true
        }
 
        //load places in map
        let places = ManagerPlaces.shared.placesFromJSON()
        let region = MKCoordinateRegion(center: places[1].coordinate, latitudinalMeters: 10_000, longitudinalMeters: 10_000)
        map.setRegion(region, animated: true)
        map.addAnnotations(places)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            self.latitude = location.coordinate.latitude
            self.longitude = location.coordinate.longitude
        }
       
    }
    
    //MARK: actions
    //Recoge la localización del GPS y envia datos 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AddEditPlaceTableViewController {
            destination.latitudeMap = latitude
            destination.longitudeMap = longitude
          
        }
    }
    
  
    @IBAction func getPosition(_ sender: Any) {
       
        if CLLocationManager.locationServicesEnabled(){
            locManager.delegate = self
            locManager.requestWhenInUseAuthorization()//permisos info.plis
            locManager.desiredAccuracy = kCLLocationAccuracyBest
            locManager.startUpdatingLocation()
        }

        
    }
    
    

}//end class


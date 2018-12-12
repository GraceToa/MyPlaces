//
//  MapViewController.swift
//  MyPlaces
//
//  Created by Grace Toa on 24/11/2018.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,CLLocationManagerDelegate {
    
    //MARK: CLLocationCoordinate2D properties
    let locManager = CLLocationManager()
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!

    
    //MARK: Outlets
    @IBOutlet weak var map: MKMapView! = nil
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
 
    
 
    
    

}//end class


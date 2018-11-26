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
    let locationManager = CLLocationManager()
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    
    //MARK: Outlets
    @IBOutlet weak var addLocationButton: UIBarButtonItem!
    @IBOutlet weak var map: MKMapView!
    //MARK: variables
    var buttonIsHidden: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        if buttonIsHidden == true {
            self.navigationItem.rightBarButtonItem?.isEnabled = true
            self.navigationItem.leftBarButtonItem?.isEnabled = true
        }
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()//permisos info.plis
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
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
        manager.stopUpdatingLocation()
    }
    
    //MARK: actions
    //Recoge la localización del GPS y envia datos 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AddEditPlaceTableViewController {
            destination.latitudeMap = latitude
            destination.longitudeMap = longitude
        }
    }
    
    

    

}//end class

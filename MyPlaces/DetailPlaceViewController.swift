//
//  DetailPlaceViewController.swift
//  MyPlaces
//
//  Created by Grace Toa on 7/11/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import UIKit

class DetailPlaceViewController: UIViewController {
    
    var place: Place?
    
    @IBOutlet weak var nameP: UILabel!
    
    @IBOutlet weak var descriptionP: UILabel!
    
    @IBOutlet weak var location: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationItem.titleView = UIImageView(image: UIImage(named: "titulNI.png"))
        title = place?.name
        if let place = place {
            nameP.text = place.name
            descriptionP.text = place.descriptionP
            location.text = place.location.longitude.description
        }
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dc = segue.destination as? AddEditPlaceTableViewController{
            dc.place = place
        }
    }
    
    
    @IBAction func edit(_ sender: Any) {
        performSegue(withIdentifier: "ShowPlaceEdit", sender: self)
    }
    

}

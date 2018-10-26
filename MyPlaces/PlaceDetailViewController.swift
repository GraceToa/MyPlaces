//
//  PlaceDetailViewController.swift
//  MyPlaces
//
//  Created by Grace Toa on 22/10/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import UIKit

class PlaceDetailViewController: UIViewController {

    var place: Place?
    
    @IBOutlet weak var constraintHeight: NSLayoutConstraint!
    
    @IBOutlet weak var namePlace: UILabel!
    
    @IBOutlet weak var descriptionPlace: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            namePlace.text = place?.name
            descriptionPlace.text = place?.description
        
    }
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

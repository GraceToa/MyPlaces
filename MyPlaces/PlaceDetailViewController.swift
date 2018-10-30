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

    @IBOutlet weak var nameP: UILabel!
    
    @IBOutlet weak var descriptP: UILabel!
    @IBOutlet weak var discountP: UILabel!
    @IBOutlet weak var locationP: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameP.text = place?.name
        descriptP.text = place?.description
        
    }
    
    //MARK: Actions

    @IBAction func close(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
}

//
//  AddEditPlaceTableViewController.swift
//  MyPlaces
//
//  Created by Grace Toa on 24/10/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import UIKit

class AddEditPlaceTableViewController: UITableViewController,UITextFieldDelegate {
    
    var place: Place?

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        descriptionTextField.delegate = self
        
        // Set up views if editing an existing Meal.
        if let place = place {
            nameTextField.text = place.name
            descriptionTextField.text = place.description
        }
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "SavePlaceDetail" {
            let nameP = nameTextField.text ?? ""
            let descP = nameTextField.text ?? ""
            
            place = Place(name: nameP, description: descP)
            
        }
    }
    
}//end class


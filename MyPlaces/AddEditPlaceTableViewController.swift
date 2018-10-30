//
//  AddEditPlaceTableViewController.swift
//  MyPlaces
//
//  Created by Grace Toa on 24/10/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//  MealViewcontroller

import UIKit
import os.log

class AddEditPlaceTableViewController: UITableViewController,UITextFieldDelegate {
    
    var place: Place?
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
//        nameTextField.delegate = self
//        descriptionTextField.delegate = self
        
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
    
    
    //MARK: Acitons
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
                os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
            let nameP = nameTextField.text ?? ""
            let descP = descriptionTextField.text ?? ""
            
            place = Place(name: nameP, description: descP, image_in: nil)
            
        
    }


    
    
    
    
    
    
    
    
    
    
    
}//end class


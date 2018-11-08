//
//  AddEditPlaceTableViewController.swift
//  MyPlaces
//
//  Created by Grace Toa on 24/10/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//  UITextFieldDelegate.- protocol le dice al compilador que puede acutar como un delegado de campo de texto válido, esto significa que puede implementar métodos de protocolo para manejar entrada de texto

import UIKit
import os.log

class AddEditPlaceTableViewController: UIViewController,UITextFieldDelegate {
    
    //MARK: Properties
    //instancia para añadir un nuevo place y pasarlo a FirstViewController
    var place: Place?
    
    //MARK: IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
         nameTextField.delegate = self

        // Configura vistas si se edita un place existente
        if let place = place {
            navigationItem.title = place.name
            nameTextField.text = place.name
            descriptionTextField.text = place.description
        }
  
        //activa el boton save solo si el textField tiene description de place
        updateSaveButtonState()
    }

    
    //MARK: UITextFieldDelegate
    
    //se llama a este método cuando comienza una sesión de edición.
    //Se desabilita el botón save mientras se edita el campo de texto
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    //indica si el sistema debe procesar la presión de la tecla Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //toma la información ingresada en el campo de texto y hace algo con ella
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
  
    
    //MARK: Acitons
    //MARK: Navigation

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The FirstViewController is not inside a navigation controller.")
        }
    }
    
    //Método que permite configurar datos que enviar al source ViewController (FirstViewController)
    //se usa un unwind segue(save Button) que retrocede un segmento
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //verifica que el remitente es un botón
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
                os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
            let nameP = nameTextField.text ?? ""
            let descP = descriptionTextField.text ?? ""
        //instancia un place que se pasa a FirstViewController
            place = Place(name: nameP, description: descP, image_in: nil)
    }

    
    //MARK: Private Methods
    
    //método auxiliar para desactivar el botón guardar si el Text Field está vacio
    private func updateSaveButtonState(){
        //desactiva el boton guardar si el textField esta vacio
        let textD = descriptionTextField.text ?? ""
        let textN = nameTextField.text ?? ""
        saveButton.isEnabled = !textD.isEmpty
        saveButton.isEnabled = !textN.isEmpty

    }
    
    
}//end class


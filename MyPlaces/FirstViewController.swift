//
//  FirstViewController.swift
//  MyPlaces
//  Los métodos que vienen definidos en los protocolos del Delegate y DataSource, implementamos
//  el contenido unicamente para dar respuestas a la aplicación cuando esta nos hace
//  preguntas. No los llamamos nunca directamente se llaman internamente
//  Created by Grace Toa on 26/9/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import UIKit
import os.log

class FirstViewController: UITableViewController {
  

    //oculta los iconos del emulador
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //to set delegate and dataSource for our UITableView!
        let view = self.view as! UITableView
        //se ha de informar siempre (manual o automatico)
        view.delegate = self
        view.dataSource = self
        //load examples
        let manager = ManagerPlaces.shared
             for place in manager.someTestPlace{
                manager.append(place)
                }
    }
    
    //MARK: Methods
  
    //Método que retorna numero de elementos para cargar
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ManagerPlaces.shared.getCount()
    }
    
    //Método interno, cada vez que la aplicación necesite mostrar una celda
    //llama a este método construye las celdas con los objetos de la lista que le corresponde
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as! PlaceTableViewCell
        let placeElement = ManagerPlaces.shared.getItemAt(position: indexPath.item)!
        cell.namePlaceLabel.text = placeElement.name
        cell.descriptionPlaceLabel.text = placeElement.description
        return cell
    }
    
    /**/
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //devuelve altura de la fila situada en una posición determinada
        return 100
    }
    

    /*Cuando le pedimos a la aplicación que tome una ruta (performSegue), iOs llama a este método en caso de que se requiera alguna preparación. En este caso,solo estamos comprobando que ruta tomar,y si esta es "ShowPlaceDetail" primero, enviamos el objeto place a la pantalla de destino*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPlaceDetail" {
            if let dc = segue.destination as? AddEditPlaceTableViewController{
                let cell = sender as! PlaceTableViewCell
                let indexPath = tableView.indexPath(for: cell )
                let selectPlace = ManagerPlaces.shared.getItemAt(position: (indexPath?.row)!)
                dc.place = selectPlace
            }
        }
    }
    
    
    //MARK: Actions

    
    //En el botton Save creamos un Unwind Segue que nos permite volver a la escena anterior de nuestro Storyboard
    @IBAction func unwindAddEditPlaceDetail(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? AddEditPlaceTableViewController, let place = sourceViewController.place {
            ManagerPlaces.shared.append(place)
            tableView.reloadData()
        }
    }
  
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "AddEditPlaceSegue", sender: self)
    }
    

}//end class


//
//  FirstViewController.swift
//  MyPlaces
//
//  Created by Grace Toa on 26/9/18.
//  Copyright © 2018 Grace Toa. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {
    
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //numbers elements of manager
        return 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        //sirve para indicar subsecciones de la lista. Devuelve 1 no hay
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //detect click in element
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //devuelve altura de la fila situada en una posición determinada
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        //devuelve una instancia de la clase UITableViewCell que pinte la fila seleccionada
        UITableViewCell {
            var cell: UITableViewCell
            cell = UITableViewCell()
            
            
            return cell
    }

}//end class


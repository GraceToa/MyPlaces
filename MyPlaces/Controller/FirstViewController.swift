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

class FirstViewController: UITableViewController {
  
    //MARK: images Background
    var images:[UIImage] = [UIImage(named: "fondo1.png")!,UIImage(named: "fondo2.png")!,UIImage(named: "fondo3.png")!,UIImage(named: "fondo4.png")!,UIImage(named: "fondo5.png")!,UIImage(named: "fondo6.png")!,UIImage(named: "fondo7.png")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        addTabBar()  

        //to set delegate and dataSource for our UITableView!
        let view = self.view as! UITableView
        view.delegate = self
        view.dataSource = self

    }
    
    //MARK: - TableView Methods
  
    //Método que retorna numero de elementos para cargar
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ManagerPlaces.shared.getCount()
    }
    
    //Método interno, cada vez que la aplicación necesite mostrar una celda
    //llama a este método construye las celdas con los objetos de la lista que le corresponde
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as! PlaceTableViewCell
        let placeCell = ManagerPlaces.shared.getItemAt(position: indexPath.item)!
   
        cell.backgroundImageView.image = randomImageCell()
        cell.bind(place: placeCell)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //devuelve altura de la fila situada en una posición determinada
        return 142
    }
    
    //Método que borra un place, si usuario se desliza horizontalmente a través de una fila,
    //el estilo de edición de la celda se configura para eliminar
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        let indexPathCell = ManagerPlaces.shared.getItemAt(position: indexPath.row)
        ManagerPlaces.shared.remove(indexPathCell!)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        ManagerPlaces.shared.updateJson()
    }

    
    //MARK: Actions
    
    //En el botton Done(AddEdit...) creamos un Unwind Segue que nos permite volver a la escena anterior de nuestro Storyboard
    //Un unwind segue puede retroceder uno o más segmentos para devolver a un Viewcontroller específico
    //Manejamos los dos casos: agregar un nuevo place y editar uno existente
    @IBAction func unwindAddEditPlaceDetail(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? AddEditPlaceTableViewController,
            let place = sourceViewController.place {
            
           //se verifica si una fila(row) de la tabla está seleccionada para editarla
            if let selectedIndexPath = self.tableView.indexPathForSelectedRow{
        
                //se busca ese place en el array obtenido del Json se reemplaza por nuevos datos
                let placeFind = ManagerPlaces.shared.getItemAt(position: selectedIndexPath.row)
                placeFind?.name = place.name
                placeFind?.descriptionP = place.descriptionP
                placeFind?.image = place.image
                placeFind?.location = place.location
                
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                ManagerPlaces.shared.updateJson()
            }
            else{
                //Add nuevo place
                ManagerPlaces.shared.append(place)
                ManagerPlaces.shared.updateJson()
                tableView.reloadData()
            }
        }
    }
    
    
    /*Cuando le pedimos a la aplicación que tome una ruta (performSegue), iOs llama a este método en caso de que se requiera alguna preparación. En este caso,solo estamos comprobando que ruta tomar,y si esta es "ShowPlaceDetail" primero, enviamos el objeto place a la pantalla de destino*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowPlaceDetail" {
          
                if let dc = segue.destination as? DetailPlaceViewController{
                    let cell = sender as! PlaceTableViewCell
                    let indexPath = tableView.indexPath(for: cell )
                    let selectPlace = ManagerPlaces.shared.getItemAt(position: (indexPath?.row)!)
                    dc.place = selectPlace
                }
        }
    }
    
    //MARK: buttons helper
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "ShowAddEditPlace", sender: self)
    }
    
    
    //MARK: navigation Bar
    func addNavBarImage()  {
        let image = UIImage(named: "titulB.png")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        navigationItem.titleView = imageView
        
        let navBar = navigationController?.navigationBar
        navBar!.setBackgroundImage(UIImage(), for: .default)
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
        navBar?.backgroundColor = .clear

        navBar!.setBackgroundImage(UIImage(named: "navBar.png")!.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch), for: .default)
    }
    //MARK: navigation TabBar
    func addTabBar()  {
        let tabBar = tabBarController?.tabBar
        tabBar?.backgroundImage = UIImage(named: "tabBar.png")
        tabBar?.clipsToBounds = true
    }
    
    //MARK: func helper random image cell
    func randomImageCell() -> UIImage {
        let unsignedArrayCount = UInt32(images.count)
        let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        let randomNumber = Int(unsignedRandomNumber)
        let generatedImage:AnyObject = images[randomNumber]
        return (generatedImage as? UIImage)!
    }
    
    
    
    
    
    
    
    
    
    
    
}//end class


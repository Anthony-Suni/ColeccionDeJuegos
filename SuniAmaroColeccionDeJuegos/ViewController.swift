//
//  ViewController.swift
//  SuniAmaroColeccionDeJuegos
//
//  Created by Jonathan on 6/05/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,    UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var juegos : [Juego] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        do {
            juegos = try context.fetch(Juego.fetchRequest())
            tableView.reloadData()
        } catch {
            print("Error al cargar los datos: \(error)")
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return juegos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let juego = juegos[indexPath.row]
        cell.textLabel?.text = juego.titulo
        if let imagenData = juego.imagen, let imagen = UIImage(data: imagenData) {
            cell.imageView?.image = imagen
        }
        return cell
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }


}


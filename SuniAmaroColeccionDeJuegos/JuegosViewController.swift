//
//  JuegosViewController.swift
//  SuniAmaroColeccionDeJuegos
//
//  Created by Jonathan on 6/05/24.
//

import UIKit
import CoreData


class JuegosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tituloTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func camaraTapped(_ sender: Any) {
    }
    @IBAction func fotosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true,
        completion: nil)
    }
    @IBAction func agregarTapped(_ sender: Any) {
        
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
                return
        }

        let juego = Juego(context: context)
        juego.titulo = tituloTextField.text
        juego.imagen = imageView.image?.jpegData(compressionQuality: 0.50)

        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print("Error al guardar los datos: \(error)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagenSeleccionada = info[.originalImage] as? UIImage {
            imageView.image = imagenSeleccionada
        }
        picker.dismiss(animated: true, completion: nil)
    }



}

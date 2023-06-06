//
//  AlertController.swift
//  DesafioTabBar
//
//  Created by Enrico Sousa Gollner on 11/04/23.
//

import UIKit

enum TypeImageSelected {
    case camera, gallery
}

class AlertController: NSObject {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func chooseImage(completion: @escaping (_ option: TypeImageSelected) -> Void ) {
        let alertController = UIAlertController(title: "Selecione a fonte abaixo", message: nil, preferredStyle: .actionSheet)
        
        let cameraButton = UIAlertAction(title: "Câmera", style: .default) { _ in
            completion(.camera)
        }
        
        let galleryButton = UIAlertAction(title: "Galeria", style: .default) { _ in
            completion(.gallery)
        }
        
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel)
        
        alertController.addAction(cameraButton)
        alertController.addAction(galleryButton)
        alertController.addAction(cancelButton)
        controller.present(alertController, animated: true)
    }
    
    func alertInformation(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(ok)
        
        controller.present(alertController, animated: true)
    }
}

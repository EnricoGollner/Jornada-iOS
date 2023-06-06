//
//  Alert.swift
//  PrimeiroAppMVVM
//
//  Created by Enrico Sousa Gollner on 25/04/23.
//

import UIKit

class Alert {
    private var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func ShowAlertInformation(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
    }
    
    public func registeredInformation(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let backToLogin = UIAlertAction(title: "Ir para a tela de Login", style: .default, handler: { _ in
            self.controller.navigationController?.popToRootViewController(animated: true)
        })
        let loginNow = UIAlertAction(title: "Entrar agora", style: .default, handler: { _ in
            let home = HomeVC()
            home.modalPresentationStyle = .fullScreen
            self.controller.present(home, animated: true)
        })
        alertController.addAction(backToLogin)
        alertController.addAction(loginNow)
        
        controller.present(alertController, animated: true)
    }
}

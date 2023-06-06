//
//  UltimaTelaViewController.swift
//  NavigationCurso
//
//  Created by Enrico Sousa Gollner on 02/04/23.
//

import UIKit

class UltimaTelaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedGoFirstScreen(_ sender: UIBarButtonItem) {
//        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popToRootViewController(animated: true) // Volta para a tela raiz/a primeira tela
    }

}

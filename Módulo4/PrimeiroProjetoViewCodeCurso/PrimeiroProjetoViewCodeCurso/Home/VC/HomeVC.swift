//
//  HomeVC.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Enrico Sousa Gollner on 15/04/23.
//

import UIKit


class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.delegate(delegate: self)
    }
}

extension HomeVC: HomeScreenProtocol {
    func tappedLogoutButton() {
        print("Logout...")
        // Caso for uma modal:
        dismiss(animated: true)
        
        // navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
    }
}

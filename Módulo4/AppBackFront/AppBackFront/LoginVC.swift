//
//  LoginVC.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 16/04/23.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

//
//  ViewController.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Enrico Sousa Gollner on 11/04/23.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {  // É o primeiro que será disparado no app. Ele quem gera a instância para nossa LoginScreen, com a finalidade de conseguirmos dizer que a minha view da View Controller vai ser a minha LoginScreen.
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)  // Assinando delegates dos UITextFields da LoginScreen
    }
    
}

extension LoginVC: LoginScreenProtocol {
    func tappedLoginButton() {
        
        // Apresentar um modal de uma Screen controladora (de navegação):
        let home = HomeVC()
        let nav = UINavigationController(rootViewController: home)
        present(nav, animated: true)
        
//        // Realizar navigation:
//        let home = HomeVC()
//        navigationController?.pushViewController(home, animated: true)
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        let email: String = loginScreen?.emailTextField.text ?? ""
        let passwordTextField: String = loginScreen?.passwordTextField.text ?? ""
        
        if !email.isEmpty && !passwordTextField.isEmpty {  // Lógica que expressa: "Precisamos que ambos tenham valores"/ "email não está vazio e password não está vazio"
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButton.backgroundColor = .darkGray
        } else {
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.loginButton.backgroundColor = .darkGray.withAlphaComponent(0.7)  // vai de 0...1, sendo 1 mais nítido.
        }
        
//        if email.isEmpty || password.isEmpty {  // Lógica que expressa: "Se ambos não possuem valores / Se um deles houver valor e o outro não, ainda será true (executando )"
//            print("Botão desabilitado")
//        } else {
//            print("Botão habilitado")
//        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return false
    }
}

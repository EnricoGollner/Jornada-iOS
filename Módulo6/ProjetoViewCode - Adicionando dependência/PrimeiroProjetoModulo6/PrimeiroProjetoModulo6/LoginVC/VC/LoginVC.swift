//
//  ViewController.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Enrico Sousa Gollner on 11/04/23.
//

import UIKit

class LoginVC: UIViewController {
    
    private var loginScreen: LoginScreen?
    private var viewModel = LoginViewModel()
    
    override func loadView() {  // É o primeiro que será disparado no app. Ele quem gera a instância para nossa LoginScreen, com a finalidade de conseguirmos dizer que a minha view da View Controller vai ser a minha LoginScreen.
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)  // Assinando delegates dos UITextFields da LoginScreen
        viewModel.delegate(delegate: self)
    }
    
}

extension LoginVC: LoginScreenProtocol {
    func tappedLoginButton() {
        viewModel.login(email: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "")
    }
}


extension LoginVC: LoginViewModelProtocol {
    func successLogin() {
        let home = HomeVC()
        home.modalPresentationStyle = .fullScreen
        present(home, animated: true)
    }
    
    func errorLogin(errorMessage: String) {
        Alert(controller: self).ShowAlertInformation(title: "Erro ao logar!", message: errorMessage)
    }
    
    func tappedGoToRegister() {
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
        // Forçando crash:
//        fatalError("Erro de teste Crashlytics ny Firebase")
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email: String = loginScreen?.emailTextField.text ?? ""
        let passwordTextField: String = loginScreen?.passwordTextField.text ?? ""
        
        if !email.isEmpty && !passwordTextField.isEmpty {  // Lógica que expressa: "Precisamos que ambos tenham valores"/ "email não está vazio e password não está vazio"
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButton.backgroundColor = .systemBlue
        } else {
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.loginButton.backgroundColor = .lightGray.withAlphaComponent(0.7)  // vai de 0...1, sendo 1 mais nítido.
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
}

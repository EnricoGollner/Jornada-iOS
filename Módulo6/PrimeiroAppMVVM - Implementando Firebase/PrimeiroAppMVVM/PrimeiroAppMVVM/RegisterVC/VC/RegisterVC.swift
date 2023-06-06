//
//  ViewController.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Enrico Sousa Gollner on 11/04/23.
//

import UIKit

class RegisterVC: UIViewController {
    
    private var registerScreen: RegisterScreen?
    private var viewModel = RegisterViewModel()
    
    override func loadView() {  // É o primeiro que será disparado no app. Ele quem gera a instância para nossa registerScreen, com a finalidade de conseguirmos dizer que a minha view da View Controller vai ser a minha registerScreen.
        registerScreen = RegisterScreen()
        view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)
        registerScreen?.configTextFieldDelegate(delegate: self)  // Assinando delegates dos UITextFields da registerScreen
        viewModel.delegate(delegate: self)
    }
    
}

extension RegisterVC: RegisterScreenProtocol {
    func tappedRegisterButton() {
        viewModel.registerUser(email: registerScreen?.emailTextField.text ?? "", password: registerScreen?.passwordTextField.text ?? "")
    }
    
    func tappedReturnToLogin() {
        navigationController?.popToRootViewController(animated: true)
    }
}


extension RegisterVC: RegisterViewModelProtocol {
    func successRegister() {
        Alert(controller: self).registeredInformation(title: "Cadastrado com sucesso", message: "Pode logar agora!")
    }
    
    func errorRegister(errorMessage: String) {
        Alert(controller: self).ShowAlertInformation(title: "Erro ao cadastrar!", message: errorMessage)
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email: String = registerScreen?.emailTextField.text ?? ""
        let passwordTextField: String = registerScreen?.passwordTextField.text ?? ""
        
        if !email.isEmpty && !passwordTextField.isEmpty {  // Lógica que expressa: "Precisamos que ambos tenham valores"/ "email não está vazio e password não está vazio"
            registerScreen?.registerButton.isEnabled = true
            registerScreen?.registerButton.backgroundColor = .black
        } else {
            registerScreen?.registerButton.isEnabled = false
            registerScreen?.registerButton.backgroundColor = .black.withAlphaComponent(0.7)  // vai de 0...1, sendo 1 mais nítido.
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
}

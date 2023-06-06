//
//  ViewController.swift
//  PrimeiraTelaCadastroCurso
//
//  Created by Enrico Sousa Gollner on 29/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet -- Sempre acima do viewDidLoad
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.keyboardType = .default
        emailTextField.keyboardType = .emailAddress
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        
        /*
         Delegate: permite a uma classe delegar/transferir algumas de suas responsabilidades a uma instância de outra classe.
         Nossa própria ViewController é responsável por "fiscalizar" essas propriedades:
        */
         nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        registerButton.isEnabled = false
        registerButton.setTitleColor(.white.withAlphaComponent(0.4), for: .disabled)
        registerButton.setTitleColor(.white, for: .normal)
        
    }

    // MARK: IBAction -- Sempre abaixo do viewDidLoad
    
    @IBAction func tappedRegisterButton(_ sender: Any) {
        print("Botão funcionando!")
    }
    
    func validateTextField() {
        if nameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" {
            print(nameTextField.text ?? "")
            print(emailTextField.text ?? "")
            print(passwordTextField.text ?? "")
            registerButton.isEnabled = true
        } else {
            registerButton.isEnabled = false
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {  // Quando clicamos para escrever algo - primeiro método a ser disparado
        print(#function)
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {   // Quando o teclado desaparece/abaixa
        print(#function)
        textField.layer.borderWidth = 0
        validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {  // Quando apertamos retorno no teclado
        print(#function)
        textField.resignFirstResponder()  // Abaixa nosso teclado
        return true
    }
    
}

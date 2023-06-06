//
//  LoginScreen.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Enrico Sousa Gollner on 13/04/23.
//

import UIKit

/*
 Uma grande característica desse framework é que não precisamos setar como falso a propriedade "translatesAutoresizingMaskIntoConstraints" de nossos elementos na criação dos mesmos, pois o SnapKit já realiza isso para nós.
 */

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
    func tappedGoToRegister()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu e-mail:", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.6)])
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.attributedPlaceholder = NSAttributedString(string: "Digite sua senha:", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.6)])
        tf.isSecureTextEntry = true
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.backgroundColor = .darkGray.withAlphaComponent(0.6)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLoginButton(_ sender: UIButton) {
        delegate?.tappedLoginButton()
    }
    
    lazy var goToRegisterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ainda não possui uma conta? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(tappedGoToRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedGoToRegisterButton(_ sender: UIButton) {
        delegate?.tappedGoToRegister()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemOrange
        addElements()
        configConstraintsNative()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(loginLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(goToRegisterButton)
    }
    
    // Métodos/formas para adicionar constraints:
    private func configConstraintsNative() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 45),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            goToRegisterButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            goToRegisterButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
}

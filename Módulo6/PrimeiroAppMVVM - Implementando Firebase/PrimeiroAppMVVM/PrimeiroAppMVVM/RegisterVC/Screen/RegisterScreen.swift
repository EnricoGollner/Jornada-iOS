//
//  RegisterScreen.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Enrico Sousa Gollner on 13/04/23.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {  // AnyObject é para que possamos criar a instância como uma "weak", uma referência fraca, que não será alocado na memória para sempre, assim, pode ser dispensado no momento em que não for mais útil.
    func tappedRegisterButton()
    func tappedReturnToLogin()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenProtocol?
    
    public func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Cadastrar"
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
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.backgroundColor = .black.withAlphaComponent(0.6)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedRegisterButton(_ sender: UIButton) {
        delegate?.tappedRegisterButton()
    }
    
    lazy var returnToLogin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Voltar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(tappedReturnToLogin), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedReturnToLogin(_ sender: UIButton) {
        delegate?.tappedReturnToLogin()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemYellow
        addElements()
        configConstraintsNative()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Método para adicionar nosso elemento em nossa View:
    private func addElements() {
        addSubview(registerLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
        addSubview(returnToLogin)
    }
    
    // Métodos/formas para adicionar constraints:
    private func configConstraintsNative() {
        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            registerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 45),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), // equalTo está referenciando o leadingAnchor da superView
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),  // é negativo, pense em um plano cartesiano.
            emailTextField.heightAnchor.constraint(equalToConstant: 45),  // equalToConstant espera apenas um valor, sabe que não o baseamos em nada. Quando trabalhamos com height ou width, usamos o equalToConstant. (para setar um valor)
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),  // Estamos que o leading do password é o mesmo que o do emailTextField
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),  // Utilizamos o equalTo quando baseamos a um outro elemento ou um devido ponto da tela.
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            returnToLogin.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
            returnToLogin.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {  // Para assinar os delegates dos UITextField
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
}

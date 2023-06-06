//
//  LoginScreen.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Enrico Sousa Gollner on 13/04/23.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {  // AnyObject é para que possamos criar a instância como uma "weak", uma referência fraca, que não será alocado na memória para sempre, assim, pode ser dispensado no momento em que não for mais útil.
    func tappedLoginButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?  // Temos apenas a referência para que o func delegate permita assinar. - Ao assinar esse protocolo, estamos dizendo que a ViewController será a responsável por interceptar a ação que nosso protocolo for dispara, no caso, tappedLoggin - Dizendo então: quem vigiará suas ações não é a Screen, mas sim a VC.
    
    public func delegate(delegate: LoginScreenProtocol?) {  // Dado que o protocolo é como se fosse um contrato, aqui estamos disponibilizando para que possa assiná-lo em algum lugar, no caso, na ViewController. Pois, como podemos ver, nosso private delegate é optional.
        self.delegate = delegate  // O delegate de fora receberá o delegate passado na função - Ao final, estamos levando a ação disparada do botão para o ViewController (LoginVC)
    }
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false  // Se não acrescentarmos essa linha, o elemento não obedecerá nossas constraints.
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
        tf.placeholder = "Digite seu e-mail:"
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
        tf.placeholder = "Digite sua senha:"
        tf.isSecureTextEntry = true  //  disables the user’s ability to copy the text in the view and, in some cases, also disables the user’s ability to record and broadcast the text in the view.
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
        button.clipsToBounds = true  // clipsToBounds é proprieade que habilita para fazermos arredondamento
        button.layer.cornerRadius = 7.5  // Para que o arredondamento for de 100% é sempre a altura dividido por 2.
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)  // O primeiro parâmetro é a classe responsável por fiscalizar quando o usuário apertará no botão (nossa própria screen, no caso).
        
        return button
    }()
    
    @objc func tappedLoginButton(_ sender: UIButton) {
        print("Logou!")
        delegate?.tappedLoginButton()  // Ação construída na classe que assina o delegate e fiscaliza as ações.
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Método para adicionar nosso elemento em nossa View:
    private func addElements() {
        addSubview(loginLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    // Método para adicionar constraints:
    private func configConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 45),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), // equalTo está referenciando o leadingAnchor da superView
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),  // é negativo, pense em um plano cartesiano.
            emailTextField.heightAnchor.constraint(equalToConstant: 45),  // equalToConstant espera apenas um valor, sabe que não o baseamos em nada. Quando trabalhamos com height ou width, usamos o equalToConstant. (para setar um valor)
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),  // Estamos que o leading do password é o mesmo que o do emailTextField
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),  // Utilizamos o equalTo quando baseamos a um outro elemento ou um devido ponto da tela.
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
        ])
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {  // Para assinar os delegates dos UITextField
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
}

//
//  HomeScreen.swift
//  NotificationCenterEProtocols
//
//  Created by Enrico Sousa Gollner on 17/04/23.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func tappedChooseButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    
    public func delegate(delegate: HomeScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var logoImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "logo_apple")?.withRenderingMode(.alwaysTemplate)  // .alwaysTemplate permite que façamos alteração de cor da image.
        img.tintColor = .white
        return img
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Teste Label"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textAlignment = .center
        return label
    }()
    
    lazy var chooseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clique Aqui", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(tappedChooseButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedChooseButton(_ sender: UIButton) {
        delegate?.tappedChooseButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(logoImageView)
        addSubview(descriptionLabel)
        addSubview(chooseButton)
    }
    
    private func configConstaints() {
        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80),  // negativo para subir, positivo para descer.
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 60),
            
            chooseButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -60),
            chooseButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            chooseButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            chooseButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

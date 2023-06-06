//
//  HomeScreen.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Enrico Sousa Gollner on 15/04/23.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func tappedLogoutButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    
    public func delegate(delegate: HomeScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Logout", for: .normal)
        button.backgroundColor = .black.withAlphaComponent(0.7)
        button.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLogoutButton() {
        delegate?.tappedLogoutButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addElements() {
        addSubview(logoutButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 45),
            logoutButton.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
}

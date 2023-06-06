//
//  ViewController.swift
//  PrimeiroProjetoAcessibilidadeCurso
//
//  Created by Enrico Sousa Gollner on 01/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    var screen: ViewControllerScreen?
    
    override func loadView() {
        screen = ViewControllerScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        configAcesibility()
    }
    
    func configAcesibility() {
        // Falando para o compilador que o elemento será lido pela acessibilidade. - Se colocarmos "false", o VoiceOver pulará o elemento - Todos vem ativado (true como default) mas boa prática é deixar tudo de maneira explícita.
        
        // isAcessibilityElement -> Possibilita a leitura da acessibilidade (como true)
        screen?.titleLabel.isAccessibilityElement = true
        screen?.positionOneLabel.isAccessibilityElement = true
        screen?.positionTwoLabel.isAccessibilityElement = true
        screen?.positionThreeLabel.isAccessibilityElement = true
        screen?.positionFourLabel.isAccessibilityElement = true
        screen?.positionFiveLabel.isAccessibilityElement = true
        screen?.loginButton.isAccessibilityElement = true
        screen?.personImageView.isAccessibilityElement = true
        
        
        // Definindo label - para falar do jeito que quisermos:
        // .accessibilityLabel é o que o VoiceOver irá falar quando o cursor estiver no elemento
        screen?.positionOneLabel.accessibilityLabel = "Posição um"
        screen?.positionTwoLabel.accessibilityLabel = "Posição dois"
        screen?.positionThreeLabel.accessibilityLabel = "Posição três"
        screen?.positionFourLabel.accessibilityLabel = "Posição quatro"
        screen?.positionFiveLabel.accessibilityLabel = "Posição cinco"
        screen?.personImageView.accessibilityLabel = "Imagem de uma pessoa"
        
        // .accessibilityTraits -> Define o tipo do elemento para o VoiceOver dizer:
        screen?.titleLabel.accessibilityTraits = .header
        screen?.positionOneLabel.accessibilityTraits = .staticText
        screen?.positionTwoLabel.accessibilityTraits = .staticText
        screen?.positionThreeLabel.accessibilityTraits = .staticText
        screen?.positionFourLabel.accessibilityTraits = .staticText
        screen?.positionFiveLabel.accessibilityTraits = .staticText
        screen?.loginButton.accessibilityTraits = .button
        screen?.personImageView.accessibilityTraits = .image
        
        // Tirando opcionalidade dos elementos e simplificando a digitação:
        guard let primeiro = screen?.positionOneLabel,
              let segundo = screen?.positionTwoLabel,
              let terceiro = screen?.positionThreeLabel,
              let quarto = screen?.positionFourLabel,
              let quinto = screen?.positionFiveLabel,
              let button = screen?.loginButton,
              let title = screen?.titleLabel,
              let image = screen?.personImageView else { return }
        
        // accessibilitElements -> Ordena os elementos acessíveis
        view.accessibilityElements = [title, primeiro, segundo, terceiro, quarto, quinto, button, image]
    }
    
}

extension ViewController: ViewControllerScreenProtocol {
    func tappedLoginButton() {
        // Passando argumento de .anouncement quando clica no botão:
        UIAccessibility.post(notification: .announcement, argument: "Teste o botão foi pressionado!")
        
        // Quando clique no botão, o cursor de acessibilidade irá para um elemento:
        UIAccessibility.post(notification: .screenChanged, argument: screen?.positionOneLabel)  // no caso, mudará o cursor para o positionOneLabel, dizendo "posição um", setado no .accessibilityLabel
    }
}




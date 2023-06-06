//
//  TabBarController.swift
//  PrimeiroAppTabBarCurso
//
//  Created by Enrico Sousa Gollner on 10/04/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configItems()
        configTabBar()
    }
    
    func configItems() {  // Opcão dos itens
        guard let item = tabBar.items else { return }
        item[0].title = "Teste 01"
        item[1].title = "Teste 02"
        item[2].title = "Teste 03"
        item[2].image = UIImage(systemName: "pencil.circle.fill")
    }
    
    func configTabBar(){  // Opção da TabBar
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .white
        
    }

}

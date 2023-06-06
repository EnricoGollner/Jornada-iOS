//
//  ViewController.swift
//  DesafioTabBar
//
//  Created by Enrico Sousa Gollner on 11/04/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBarItems()
        configTabBar()
    }
    
    func configTabBarItems() {
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "person")
        items[0].title = "Tela 01"
        
        items[1].image = UIImage(systemName: "phone.fill")
        items[1].title = "Tela 02"
        
        items[2].image = UIImage(systemName: "trash.fill")
        items[2].title = "Tela 03"
    }
    
    func configTabBar() {
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .white
    }
    
}


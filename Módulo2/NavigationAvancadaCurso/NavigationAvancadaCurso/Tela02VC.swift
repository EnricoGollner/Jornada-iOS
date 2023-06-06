//
//  Tela02VC.swift
//  NavigationAvancadaCurso
//
//  Created by Enrico Sousa Gollner on 02/04/23.
//

import UIKit

class Tela02VC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    let name: String
    
    init?(coder: NSCoder, name: String){
        self.name = name
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
    }
}

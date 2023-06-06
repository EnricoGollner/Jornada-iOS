//
//  ViewController.swift
//  UIImageViewCurso
//
//  Created by Enrico Sousa Gollner on 01/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Image from assets:
        // logoImageView.image = UIImage(named: "swift_logo")
        
        // System images:
        logoImageView.image = UIImage(systemName: "brain.head.profile")
        logoImageView.contentMode = .scaleAspectFit
        
        logoImageView.tintColor = .red  // render as "template image" required - system images already are templates.
    }

}


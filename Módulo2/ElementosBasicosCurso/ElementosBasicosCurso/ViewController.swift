//
//  ViewController.swift
//  ElementosBasicosCurso
//
//  Created by Enrico Sousa Gollner on 28/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var bemVindoLabel: UILabel?
    
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var passwordTextField: UITextField?
    
    @IBOutlet weak var logginButton: UIButton!
    
    // MARK: - IBActions
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        view.backgroundColor = .green
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}


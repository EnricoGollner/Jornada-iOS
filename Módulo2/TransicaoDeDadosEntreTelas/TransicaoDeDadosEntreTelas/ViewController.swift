//
//  ViewController.swift
//  TransicaoDeDadosEntreTelas
//
//  Created by Enrico Sousa Gollner on 03/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tappedGoToScreen2(_ sender: Any) {
        let vc2: Tela02VC? = UIStoryboard(name: "Tela02VC", bundle: nil).instantiateViewController(identifier: "Tela02VC") { coder in
            return Tela02VC(coder: coder, name: self.nameTextField.text ?? "")
        }
        
        self.navigationController?.pushViewController(vc2 ?? UIViewController(), animated: true)
    }
}


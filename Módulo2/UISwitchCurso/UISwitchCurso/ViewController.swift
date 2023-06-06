//
//  ViewController.swift
//  UISwitchCurso
//
//  Created by Enrico Sousa Gollner on 01/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stateSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateSwitch.isOn = true
        stateSwitch.onTintColor = .blue  // Define a cor do tint para quando está on
        
    }
    
    @IBAction func tappedSwitchAction(_ sender: UISwitch) {
        print(sender.isOn)
        
        if sender.isOn {
            view.backgroundColor = .green
        } else {
            view.backgroundColor = .red
        }
    }
}


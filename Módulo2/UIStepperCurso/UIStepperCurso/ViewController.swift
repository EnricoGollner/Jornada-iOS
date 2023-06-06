//
//  ViewController.swift
//  UIStepperCurso
//
//  Created by Enrico Sousa Gollner on 02/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.minimumValue = 0
        stepper.value = 0
        stepper.maximumValue = 100
        stepper.stepValue = 10  // de quanto em quanto ele vai pular
        
    }
    
    @IBAction func tappedStepper(_ sender: UIStepper) {
        valueLabel.text = String(Int(sender.value))
    }
}


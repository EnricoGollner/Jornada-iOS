//
//  ViewController.swift
//  UISliderCurso
//
//  Created by Enrico Sousa Gollner on 01/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.minimumValue = 0  // Posição inicial
        slider.value = 0  // atual
        slider.maximumValue = 20  // Final
        
        // Cores:
        slider.minimumTrackTintColor = .red  // A parte pela qual já passamos
        slider.maximumTrackTintColor = .blue  // O que falta
        slider.thumbTintColor = .green  // A cor do círculo/alça
        
    }

    @IBAction func tappedSlider(_ sender: UISlider) {
        print(Int(sender.value))
    }
    
}


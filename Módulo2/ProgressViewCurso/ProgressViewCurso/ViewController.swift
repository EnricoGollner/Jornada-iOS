//
//  ViewController.swift
//  ProgressViewCurso
//
//  Created by Enrico Sousa Gollner on 01/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets:
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // progressView.progress = 0.3
        
        progressView.tintColor = .green  // Cor da barra carregando (preenchido)
        progressView.trackTintColor = .lightGray.withAlphaComponent(0.6)  // Cor da barra para carregar (não preenchido)
        
        // Criando a quantidade de repartições que queremos:
        let total = Progress(totalUnitCount: 100)  // Instânciamos um progress com um total de 100 (valor máximo)
        total.completedUnitCount = 25  // O valor que queremos que permaneça
        progressView.setProgress(Float(total.fractionCompleted), animated: true)  // .fractionCompleted é qual a fração que queremos completar o process em sí
    }


}


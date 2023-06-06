//
//  CustomTableViewCell.swift
//  PrimeiraTableViewCurso
//
//  Created by Enrico Sousa Gollner on 04/04/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier: String = "CustomTableViewCell"
    
    public static func nib() -> UINib {  // Usada para o register da nib (referência para indicar qual é o nosso arquivo da .xib) - onde dizemos que a nossa .xib é a nossa parte de visualização gráfica
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    // MARK: - Lifecycle - Ciclo de vida inicial (Mesma coisa que ViewDidLoad mas para Células é awakeFromNib)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setUpCell(title: String) {
        titleLabel.text = title
    }
}

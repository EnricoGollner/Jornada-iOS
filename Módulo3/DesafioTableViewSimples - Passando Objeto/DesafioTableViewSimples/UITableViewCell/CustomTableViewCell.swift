//
//  CustomTableViewCell.swift
//  DesafioTableViewSimples
//
//  Created by Enrico Sousa Gollner on 06/04/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    
    static let identifier = "CustomTableViewCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none  // Nenhum estilo na seleção de uma célula
    }
    
    func setUpCell(_ data: Car) {
        self.labelTitle.text = data.brand
        self.carImageView.image = data.brandImage
    }
    
}

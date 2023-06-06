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
        
        carImageView.image = UIImage(named: "carro")
    }
    
    func setUpCell(title: String) {
        self.labelTitle.text = title
    }
    
}

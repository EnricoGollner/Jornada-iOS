//
//  CustomTableViewCell.swift
//  DesafioTabBar
//
//  Created by Enrico Sousa Gollner on 11/04/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dataImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "CustomTableViewCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        contentView.backgroundColor = .white
        titleLabel.textColor = .black
        
    }
    
    func setUpCell(pickedImage: UIImage, titleForLabel: String){
        dataImage.image = pickedImage
        titleLabel.text = titleForLabel
    }
    
}

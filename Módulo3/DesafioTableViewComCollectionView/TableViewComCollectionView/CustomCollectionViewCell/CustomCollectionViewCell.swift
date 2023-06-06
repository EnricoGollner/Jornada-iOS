//
//  CustomCollectionViewCell.swift
//  TableViewComCollectionView
//
//  Created by Enrico Sousa Gollner on 10/04/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var carImageView: UIImageView!
    
    static let identifier = "CustomCollectionViewCell"
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carImageView.contentMode = .scaleAspectFill
    }
    
    func setUpCell(imageName: String) {
        carImageView.image = UIImage(named: imageName)
    }

}

//
//  CustomCollectionViewCell.swift
//  PrimeiroProjetoCollectionViewCurso
//
//  Created by Enrico Sousa Gollner on 06/04/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var carImageView: UIImageView!
    
    static let identifier: String = "CustomCollectionViewCell"
    
    static func getNib() -> UINib {  // nib é uma referência para indicar qual é o nosso arquivo da .xib
        return UINib(nibName: self.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        carImageView.contentMode = .scaleAspectFill
    }
    
    func setUpCell(nameImage: String) {
        self.carImageView.image = UIImage(named: nameImage)
    }

}

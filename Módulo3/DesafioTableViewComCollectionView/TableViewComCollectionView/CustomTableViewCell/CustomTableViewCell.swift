//
//  CustomTableViewCell.swift
//  TableViewComCollectionView
//
//  Created by Enrico Sousa Gollner on 10/04/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let listCar: [String] = ["m4", "macLarenP1", "tesla"]
    
    static let identifier = "CustomTableViewCell"
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = .boldSystemFont(ofSize: 17)
        
        configCollectionView()
    }
    
    func setUpCell(title: String) {
        self.titleLabel.text = title
    }
    
    func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
        collectionView.register(CustomCollectionViewCell.getNib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
}

extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        
        collectionViewCell?.setUpCell(imageName: listCar[indexPath.row])
        
        return collectionViewCell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width, height: 353)  // contentView é como se fosse nossa view, que pegamos lá da  CustomTableViewCell viewController
    }
    
}



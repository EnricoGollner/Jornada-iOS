//
//  StoryCollectionViewCell.swift
//  PrimeiroAppMVVM
//
//  Created by Enrico Sousa Gollner on 22/04/23.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoryCollectionViewCell"
    
    private var viewModel = StoryCollectionViewModel()
    
    private var screen = StoryCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen()  {
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
    }
    
    public func setUpCell(data: Stories, indexPath: IndexPath) {
        screen.profileImageView.image = UIImage(named: data.image ?? "")
        screen.userNameLabel.text = data.userName
        screen.addButton.isHidden = viewModel.addButtonIsHidden(row: indexPath.row)
    }
}

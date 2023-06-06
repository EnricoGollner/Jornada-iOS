//
//  PostCardCollectionViewCell.swift
//  PrimeiroAppMVVM
//
//  Created by Enrico Sousa Gollner on 23/04/23.
//

import UIKit

class PostCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PostCardCollectionViewCell"
    
    private var screen = PostCardCollectionViewCellScreen()
    
    private var viewModel: PostCardViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
        screen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configScreen() {
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: self)
    }
    
    public func setUpCell(listPosts: [Posts]) {
        viewModel = PostCardViewModel(listPosts: listPosts)
    }
}

extension PostCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell
        cell?.setUpCell(data: viewModel.loadCurrentPost(indexPath: indexPath))
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 450)
    }
    
}

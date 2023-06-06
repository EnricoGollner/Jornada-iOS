//
//  StoryCardCollectionViewCell.swift
//  PrimeiroAppMVVM
//
//  Created by Enrico Sousa Gollner on 21/04/23.
//

import UIKit

class StoryCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoryCardCollectionViewCell"
    
    private var screen = StoryCardCollectionViewCellScreen()
    
    private var viewModel: StoryCardViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
        screen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)  // contentView é: The main view that you add your cell’s custom content to. - A view principal, vazia onde setamos nosso conteúdo para a célula
        screen.pin(to: contentView)  // Assim, nossa screen preenche todo o espaço da contentView.
    }
    
    public func setUpCell(listStory: [Stories]) {
        viewModel = StoryCardViewModel(listStory: listStory)  // Só criamos a instância e atribuição da ViewModel aqui pois ela precisa que passemos uma listStory, que só será obtida no setUp da célula.
    }
}

extension StoryCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell
        cell?.setUpCell(data: viewModel.loadCurrentStory(indexPath: indexPath), indexPath: indexPath)
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
}

//
//  ViewController.swift
//  PrimeiroAppMVVM
//
//  Created by Enrico Sousa Gollner on 21/04/23.
//

import UIKit

class HomeVC: UIViewController {
    
    private var homeScreen: HomeScreen?
    private var viewModel = HomeViewModel()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetchAllRequest()
    }
    
}

// Precisamos que conforme com "UICollectionViewDelegateFlowLayout" para que possamos utilizar o sizeForItem para definir respectivos tamanhos para as nossas células.
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCardCollectionViewCell.identifier, for: indexPath) as? StoryCardCollectionViewCell
            cell?.setUpCell(listStory: viewModel.getListStory)
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCardCollectionViewCell.identifier, for: indexPath) as? PostCardCollectionViewCell
            cell?.setUpCell(listPosts: viewModel.getListPosts)
            return cell ?? UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.sizeForItem(indexPath: indexPath, frame: collectionView.frame)  // no collectionView.frame, significa que estamos passando a largura e altura totais (em CGRect) da collectionView - Então estamos dizendo "quando der sucesso, rode o código que dá vida a CollectionView" - manda ela carregar, pois agora nossos dados existem
    }
}

extension HomeVC: HomeViewModelProtocol {
    func success() {
        print(#function)
        DispatchQueue.main.async { // Utilizado quando queremos que o bloco dentro dessa função só dispare quando estivermos na thread principal (main). - Trabalhando com o Alamofire, não precisamos colocá-lo, mas com o URLSession precisaremos. Pois o Alamofire já tem por debaixo dos panos.
            self.homeScreen?.configProtocolsCollectionView(delegate: self, dataSource: self)  // Método que assina o delegate para darmos vida a collection - deve ser chamado quando a requisição terminar, por isso está sendo chamado aqui.
        }
    }
    
    func error() {
        print(#function)
    }
}

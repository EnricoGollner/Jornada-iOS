//
//  HomeViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by Enrico Sousa Gollner on 21/04/23.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject {
    func success()
    func error()
}

// ViewModel tem a reponsabilidade de cuidar de toda a parte lógica
class HomeViewModel {
    
    private weak var delegate: HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol) {
        self.delegate = delegate
    }
    
    private var service = HomeService()
    private var posts = [Posts]()
    private var story = [Stories]()
    
    public var getListPosts: [Posts] {
        posts
    }
    
    public var getListStory: [Stories] {
        story
    }
    
    public var numberOfItems: Int {
        2
    }
    
    public func sizeForItem(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {  // se for a primeira célula
            return CGSize(width: 120, height: frame.height)  // frame.height significa: altura da própria collectionView
        } else {
            return CGSize(width: frame.width - 120, height: frame.height)  // sobre a largura, ele pega a largura total da collectionView em si e subtrai 120, pois a primeira célula já existe
        }
    }
    
    public func fetchAllRequest() {
        
        // Trabalhando com o MOCK fazendo leitura de dados/arquivo:
//        service.getHomeDataJSON { homeData, error in
//            if error == nil {
//                self.posts = homeData?.posts ?? []
//                self.story = homeData?.stories ?? []
//            } else {
//                print(error?.localizedDescription ?? "")
//            }
//        }
        
        //Trabalhando com Alamofire para requisição:
//        service.getHomeDataAlamofire { homeData, error in
//            if error == nil {
//                self.posts = homeData?.posts ?? []
//                self.story = homeData?.stories ?? []
//                self.delegate?.success()
//            } else {
//                self.delegate?.error()
//            }
//        }
        
        // Trabalhando com URLSession para requisição:
        service.getHomeDataURLSession { homeData, error in  // completion
            if error == nil {
                self.posts = homeData?.posts ?? []
                self.story = homeData?.stories ?? []
                self.delegate?.success()
            } else {
                self.delegate?.error()
            }
        }
        
    }
    
}

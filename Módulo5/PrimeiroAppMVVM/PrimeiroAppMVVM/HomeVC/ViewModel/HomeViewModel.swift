//
//  HomeViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by Enrico Sousa Gollner on 21/04/23.
//

import UIKit

// ViewModel tem a reponsabilidade de cuidar de toda a parte lógica
class HomeViewModel {
    
    private var story = [  // private pois nenhuma outra camada deve acessá-lo
        Stories(image: "img1", userName: "Add Story"),
        Stories(image: "img2", userName: "jack"),
        Stories(image: "img3", userName: "carolina"),
        Stories(image: "img4", userName: "samuel"),
        Stories(image: "img5", userName: "ariana josep"),
        Stories(image: "img6", userName: "puggy_101"),
        Stories(image: "img7", userName: "dheeraj_ks")
    ]
    
    public var getListStory: [Stories] {  // getter
        story
    }
    
    public var posts = [
        Posts(profileImage: "img2", userName: "jack", postImage: "post1"),
        Posts(profileImage: "img4", userName: "samuel", postImage: "post2"),
        Posts(profileImage: "img3", userName: "carolina", postImage: "post3"),
        Posts(profileImage: "img6", userName: "puggy_101", postImage: "post4"),
    ]
    
    public var getListPosts: [Posts] {
        posts
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
    
}

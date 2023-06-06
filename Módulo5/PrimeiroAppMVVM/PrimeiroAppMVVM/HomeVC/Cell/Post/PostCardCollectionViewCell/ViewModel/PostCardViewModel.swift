//
//  PostCardCollectionViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by Enrico Sousa Gollner on 23/04/23.
//

import UIKit

class PostCardViewModel {
    
    private var listPosts: [Posts]
    
    init(listPosts: [Posts]){
        self.listPosts = listPosts
    }
    
    public var numberOfItems: Int {
        listPosts.count
    }
    
    public func loadCurrentPost(indexPath: IndexPath) -> Posts {
        listPosts[indexPath.row]
    }
    
}

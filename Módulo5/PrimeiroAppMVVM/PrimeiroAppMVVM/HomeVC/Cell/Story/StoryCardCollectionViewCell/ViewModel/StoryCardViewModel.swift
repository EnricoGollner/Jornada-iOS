//
//  StoryCardViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by Enrico Sousa Gollner on 21/04/23.
//

import UIKit

class StoryCardViewModel {
    
    private var listStory: [Stories]
    
    init(listStory: [Stories]) {
        self.listStory = listStory
    }
    
    public var numberOfItems: Int {
        listStory.count
    }
    
    func loadCurrentStory(indexPath: IndexPath) -> Stories {
        listStory[indexPath.row]
    }
    
}

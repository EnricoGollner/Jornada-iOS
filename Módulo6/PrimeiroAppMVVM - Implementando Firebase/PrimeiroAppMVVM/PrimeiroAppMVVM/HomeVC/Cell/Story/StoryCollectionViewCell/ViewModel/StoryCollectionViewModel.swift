//
//  StoryCollectionViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by Enrico Sousa Gollner on 22/04/23.
//

import UIKit

class StoryCollectionViewModel {
    public func addButtonIsHidden(row: Int) -> Bool {
        row == 0 ? false : true
    }
}

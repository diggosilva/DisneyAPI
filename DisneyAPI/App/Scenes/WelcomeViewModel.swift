//
//  WelcomeViewModel.swift
//  DisneyAPI
//
//  Created by Diggo Silva on 05/09/24.
//

import Foundation

enum WelcomeViewControllerStates {
    case loading
    case loaded
    case error
}

class WelcomeViewModel {
    var state: Bindable<WelcomeViewControllerStates> = Bindable(value: .loading)
    
    
    func loadData() {
        
    }
    
}

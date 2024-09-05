//
//  WelcomeViewController.swift
//  DisneyAPI
//
//  Created by Diggo Silva on 05/09/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let viewModel = WelcomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        handleStates()
        viewModel.loadData()
    }
    
    private func setNavBar() {
        title = "Disney API"
        view.backgroundColor = .white
    }
    
    private func handleStates() {
        viewModel.state.bind { states in
            switch states {
            case .loading:
                return self.showLoadingState()
            case .loaded:
                return self.showLoadedState()
            case .error:
                return self.showErrorState()
            }
        }
    }
    
    private func showLoadingState() {
        
    }
    
    private func showLoadedState() {
        
    }
    
    private func showErrorState() {
        
    }
    
}

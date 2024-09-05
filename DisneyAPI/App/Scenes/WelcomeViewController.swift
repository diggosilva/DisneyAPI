//
//  WelcomeViewController.swift
//  DisneyAPI
//
//  Created by Diggo Silva on 05/09/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let welcomeView = WelcomeView()
    let viewModel = WelcomeViewModel()
    
    override func loadView() {
        super.loadView()
        view = welcomeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDataSources()
        handleStates()
        viewModel.loadData()
    }
    
    private func setNavBar() {
        setNavBar(text: " Disney API")
    }
    
    private func setDelegatesAndDataSources() {
        welcomeView.delegate = self
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

extension WelcomeViewController: WelcomeViewDelegate {
    func didTapButton() {
        let feedVC = FeedViewController()
        navigationController?.pushViewController(feedVC, animated: true)
    }
}

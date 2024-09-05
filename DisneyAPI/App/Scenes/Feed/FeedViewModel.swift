//
//  FeedViewModel.swift
//  DisneyAPI
//
//  Created by Diggo Silva on 05/09/24.
//

import Foundation

enum FeedViewControllerStates {
    case loading
    case loaded
    case error
}

class FeedViewModel {
    var state: Bindable<FeedViewControllerStates> = Bindable(value: .loading)
    private var service: ServiceProtocol = Service()
    private var movies: [FeedModel] = []
    private var filteredMovies: [FeedModel] = []
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    func numberOfRowsInSection() -> Int {
        return filteredMovies.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> FeedModel {
        return filteredMovies[indexPath.row]
    }
    
    func fetchRequest() {
        service.getMovies { movies in
            self.movies.append(contentsOf: movies)
            self.filteredMovies.append(contentsOf: movies)
            self.state.value = .loaded
        } onError: { error in
            self.state.value = .error
        }
    }
}

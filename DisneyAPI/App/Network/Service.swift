//
//  Service.swift
//  DisneyAPI
//
//  Created by Diggo Silva on 05/09/24.
//

import Foundation

protocol ServiceProtocol {
    func getMovies(onSuccess: @escaping([FeedModel]) -> Void, onError: @escaping(Error) -> Void)
}

final class Service: ServiceProtocol {
    private var dataTask: URLSessionDataTask?
    
    func getMovies(onSuccess: @escaping([FeedModel]) -> Void, onError: @escaping(Error) -> Void) {
        guard let url = URL(string: "https://api.disneyapi.dev/character/") else { return }
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    print("DEBUG: Status Code.. \(response.statusCode)")
                }
                do {
                    let feedResponse = try JSONDecoder().decode(FeedResponse.self, from: data ?? Data())
                    var feedModel: [FeedModel] = []
                    
                    for movie in feedResponse.data {
                        feedModel.append(FeedModel(nomeFilme: movie.films.joined(separator: ", "), nomeAtor: movie.name))
                        print("RESPONSE: \(feedResponse)")
                    }
                    onSuccess(feedModel)
                } catch {
                    onError(error)
                    print("DEBUG: ERRO ao decodificar MOVIES \(error.localizedDescription)")
                }
            }
        })
        dataTask?.resume()
    }
    
}

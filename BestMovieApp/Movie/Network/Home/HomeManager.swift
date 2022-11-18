//
//  HomeManager.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import Foundation
import Alamofire


protocol HomeManagerProtocol {
    func getCategoryMovies(type: MovieCategory, onSuccess: @escaping(Movies?) -> (), onError: @escaping (AFError) -> ())
}


class HomeManager: HomeManagerProtocol {
    static let shared = HomeManager()
    
    func getCategoryMovies(type: MovieCategory, onSuccess: @escaping (Movies?) -> (), onError: @escaping (AFError) -> ()) {
        var url = ""
        switch type {
        case .nowPlaying:
            url = HomeEndpoint.nowPlaying.path
        case .latest:
            url = HomeEndpoint.latest.path
        case .popular:
            url = HomeEndpoint.popular.path
        case .topRated:
            url = HomeEndpoint.topRated.path
        case .upcoming:
            url = HomeEndpoint.upcoming.path
        }
        NetworkManager.shared.request(path: url) { (response: Movies) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }

    }
    

}


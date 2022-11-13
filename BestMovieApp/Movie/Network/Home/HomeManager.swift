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
            url = HomeEndPoint.nowPlaying.path
        case .latest:
            url = HomeEndPoint.latest.path
        case .popular:
            url = HomeEndPoint.popular.path
        case .topRated:
            url = HomeEndPoint.topRated.path
        case .upcoming:
            url = HomeEndPoint.upcoming.path
        }
        NetworkManager.shared.request(path: url) { (response: Movies) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }

    }
    

}


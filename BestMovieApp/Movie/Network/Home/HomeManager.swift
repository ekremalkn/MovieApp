//
//  HomeManager.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import Foundation
import Alamofire

protocol HomeManagerProtocol {
    func getCategoryMovies(onSuccess: @escaping(Movies?) -> (), onError: @escaping (AFError) -> ())
}


class HomeManager: HomeManagerProtocol {
    static let shared = HomeManager()
    
    func getCategoryMovies(onSuccess: @escaping (Movies?) -> (), onError: @escaping (AFError) -> ()) {
        NetworkManager.shared.request(path: HomeEndPoint.nowPlaying.path) { (response: Movies) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }

    }
    

}


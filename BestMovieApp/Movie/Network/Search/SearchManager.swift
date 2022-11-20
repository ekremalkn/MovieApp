//
//  SearchManager.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 18.11.2022.
//

import Foundation
import Alamofire
protocol SearchManagerProtocol {
    func getSearchItems(text: String, onSuccess: @escaping(Movies?) -> (), onError: @escaping (AFError) -> ())
}

class SearchManager: SearchManagerProtocol {
    static let shared = SearchManager()
    func getSearchItems(text: String, onSuccess: @escaping(Movies?) -> (), onError: @escaping (AFError) -> ()) {
        let url = SearchEndpoint.search.path + "&query=\(text)"
        NetworkManager.shared.request(path: url) { (response: Movies) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}

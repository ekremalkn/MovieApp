//
//  DetailManager.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 24.11.2022.
//

import Foundation
import Alamofire

protocol DetailManagerProtocol {
    func getDetailItems(id: Int, onSuccess: @escaping(MovieMoreDetail?) -> (), onError: @escaping (AFError) -> ())
}

class DetailManager: DetailManagerProtocol {
    static let shared = DetailManager()
    func getDetailItems(id: Int, onSuccess: @escaping (MovieMoreDetail?) -> (), onError: @escaping (Alamofire.AFError) -> ()) {
       
        let url = "\(NetworkHelper.shared.requestUrl(url: "\(DetailEndPoint.detail1.rawValue + "\(id)" + DetailEndPoint.detail2.rawValue)"))"
        NetworkManager.shared.request(path: url) { (response: MovieMoreDetail) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }

    }
 
}

//
//  NetworkHelper.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import Foundation


enum NetworkEndPoint: String {
    case BASE_URL = "https://api.themoviedb.org/3/"
    case API_KEY = "api_key=24b16e5b23b18708f6570f9ad838a7aa"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    func requestUrl(url: String) -> String {
        return "\(NetworkEndPoint.BASE_URL.rawValue)\(url)\(NetworkEndPoint.API_KEY.rawValue)"
    }
}

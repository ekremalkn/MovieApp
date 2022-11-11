//
//  NetworkHelper.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import Foundation


enum NetworkEndPoint: String {
    case BASE_URL = "https://api.themoviedb.org/3/"
    case API_KEY = "api_key=c87892a569d35450fcbb3cff10214986"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    func requestUrl(url: String) -> String {
        return "\(NetworkEndPoint.BASE_URL.rawValue)\(url)\(NetworkEndPoint.API_KEY.rawValue)"
    }
    
}

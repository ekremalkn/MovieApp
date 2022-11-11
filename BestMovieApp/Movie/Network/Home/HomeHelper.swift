//
//  HomeHelper.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import Foundation

enum HomeEndPoint: String {
    case nowPlaying = "movie/now_playing?"
    
    var path: String {
        switch self {
        case .nowPlaying:
            
            return NetworkHelper.shared.requestUrl(url: HomeEndPoint.nowPlaying.rawValue)
        }
    }
}

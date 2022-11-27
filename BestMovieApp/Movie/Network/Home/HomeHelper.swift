//
//  HomeHelper.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import Foundation

enum MovieCategory {
    case nowPlaying
    case popular
    case topRated
    case upcoming
}
enum HomeEndpoint: String {
    case nowPlaying = "movie/now_playing?"
    case popular = "movie/popular?"
    case topRated = "movie/top_rated?"
    case upcoming = "movie/upcoming?"
    
    var path: String {
        switch self {
        case .nowPlaying:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.nowPlaying.rawValue)
        case .popular:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.popular.rawValue)
        case .topRated:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.topRated.rawValue)
        case .upcoming:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.upcoming.rawValue)
        }
    }
}

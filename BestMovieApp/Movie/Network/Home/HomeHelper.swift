//
//  HomeHelper.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import Foundation

enum MovieCategory {
    case nowPlaying
    case latest
    case popular
    case topRated
    case upcoming
}
enum HomeEndPoint: String {
    case nowPlaying = "movie/now_playing?"
    case latest = "movie/latest?"
    case popular = "movie/popular?"
    case topRated = "movie/top_rated?"
    case upcoming = "movie/upcoming?"
    
    var path: String {
        switch self {
        case .nowPlaying:
            return NetworkHelper.shared.requestUrl(url: HomeEndPoint.nowPlaying.rawValue)
        case .latest:
            return NetworkHelper.shared.requestUrl(url: HomeEndPoint.latest.rawValue)
        case .popular:
            return NetworkHelper.shared.requestUrl(url: HomeEndPoint.popular.rawValue)
        case .topRated:
            return NetworkHelper.shared.requestUrl(url: HomeEndPoint.topRated.rawValue)
        case .upcoming:
            return NetworkHelper.shared.requestUrl(url: HomeEndPoint.upcoming.rawValue)
        }
    }
}

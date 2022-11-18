//
//  SearchHelper.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 18.11.2022.
//

import Foundation

enum SearchEndpoint: String {
    case search = "movie/popular?"
    
    var path: String {
        switch self {
        case .search:
            return NetworkHelper.shared.requestUrl(url: SearchEndpoint.search.rawValue)
        }
    }
}

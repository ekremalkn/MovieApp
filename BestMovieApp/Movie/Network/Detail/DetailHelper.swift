//
//  DetailHelper.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 24.11.2022.
//

import Foundation

enum DetailEndPoint: String {
    case detail1 = "movie/"
    case detail2 = "/watch/providers?"
    
    var path: String {
        switch self {
        case .detail1:
            return DetailEndPoint.detail1.rawValue
        case .detail2:
            return DetailEndPoint.detail2.rawValue
        }
    }
}


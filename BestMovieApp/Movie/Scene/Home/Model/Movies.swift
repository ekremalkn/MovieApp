//
//  Movie.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import Foundation

// MARK: - Movies
struct Movies: Codable {
    let dates: Dates?
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages
        case totalResults
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String?
}

// MARK: - MovieResult
struct MovieResult: Codable, TopMovieCellProtocol {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    var posterImage: String {
        "https://image.tmdb.org/t/p/original/\(posterPath ?? "")"
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath
        case genreIDS
        case id
        case originalLanguage
        case originalTitle
        case overview, popularity
        case posterPath
        case releaseDate
        case title, video
        case voteAverage
        case voteCount
    }
}

enum OriginalLanguage: String, Codable {
    case de = "de"
    case en = "en"
    case es = "es"
    case ja = "ja"
}

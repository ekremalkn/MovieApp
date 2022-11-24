//
//  Movie.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//


import Foundation

// MARK: - Movies
struct Movies: Codable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - MovieResult
struct MovieResult: Codable, HorizontalMovieCellProtocol, VerticalMovieCellProtocol, SearchMovieCellProtocol, DetailMovieViewProtocol {
  
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    //MARK: - HorizantalMovieCellProtocol
    var horizontalCellTitle: String {
        originalTitle ?? ""
    }
    
    var horizontalCellRelease: String {
        releaseDate ?? ""
    }
    
    var horizontalCellRating: String {
        if let voteAverage = voteAverage {
            return "\(voteAverage)"
        }
        return ""
    }
    
    var horizontalCellImage: String {
        "https://image.tmdb.org/t/p/original/\(posterPath ?? "")"
    }
    
    //MARK: - VerticalMovieCellProtocol
    var verticalCellImage: String {
        "https://image.tmdb.org/t/p/original/\(posterPath ?? "")"
    }
    
    var verticalCellTitle: String {
        originalTitle ?? ""
    }
    
    var verticalCellRelease: String{
        releaseDate ?? ""
    }
    
    //MARK: - SearchMovieCellProtocol
    
    var searchCellImage: String {
        "https://image.tmdb.org/t/p/original/\(posterPath ?? "")"
    }
    
    var searchCellTitle: String {
        originalTitle ?? ""
    }
    
    //MARK: - DetailMovieViewProtocol
    var detailViewId: Int {
        id ?? 0
    }
    
    var detailViewBigImage: String {
        "https://image.tmdb.org/t/p/original/\(posterPath ?? "")"
    }
    
    var detailViewSmallImage: String {
        "https://image.tmdb.org/t/p/original/\(posterPath ?? "")"
    }
    
    var detailViewTitle: String {
        originalTitle ?? ""
    }
    
    var detailViewRate: String {
        if let voteAverage = voteAverage {
            return "\(voteAverage)"
        }
        return ""
    }
    
    var detailViewRelease: String {
        releaseDate ?? ""
    }
    
    var detailViewOverview: String {
        overview ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


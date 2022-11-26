//
//  SearchViewModel.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 18.11.2022.
//

import Foundation

class SearchViewModel {
    let manager = SearchManager.shared
    var movieItems = [MovieResult]()
    
    var text = ""
    
    var successCallback: (()->())?
    
    //MARK: - Getting data to Model

    func getMovies() {
        manager.getSearchItems(text: text) { movies in
            if let movies = movies {
                self.movieItems = movies.results ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("Error while getting .nowPlaying list \(error)")
        }
        
    }
}



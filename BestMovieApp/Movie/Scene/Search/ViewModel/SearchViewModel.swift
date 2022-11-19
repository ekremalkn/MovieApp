//
//  SearchViewModel.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 18.11.2022.
//

import Foundation

class SearchViewModel {
    var items: Movies?
    var movieItems = [MovieResult]()
    
    var text = ""
    
    var successCallback: (()->())?
    
    func getMovies() {
        SearchManager.shared.getSearchItems(text: text) { movies in
            if let movies = movies {
                self.movieItems = movies.results ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("Error while getting .nowPlaying list \(error)")
        }
        
    }
}



//
//  HomeViewModel.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import Foundation

class HomeViewModel {
    let manager = HomeManager.shared
    
    var movies: Movies?
  
    func getCategoryItems() {
        manager.getCategoryMovies { movies in
            self.movies = movies
            
            
        } onError: { error in
            print(error)
            
        }

    }
}

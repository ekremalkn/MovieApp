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
    var nowPlayingItems = [MovieResult]()
  
    func getNowPlaying() {
        manager.getCategoryMovies(type: .nowPlaying) { movies in
            if let movies = movies {
                self.nowPlayingItems = movies.results ?? []
            }
        } onError: { error in
            print("Error while getting .nowPlaying list \(error)")
        }

    }
    func getPopuler() {
        manager.getCategoryMovies(type: .popular) { movies in
            self.movies = movies
            
            
        } onError: { error in
            print("Error while getting CategoryMovies list \(error)")
            
        }

    }
}

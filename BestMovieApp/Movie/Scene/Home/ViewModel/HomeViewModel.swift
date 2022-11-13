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
    
    var errorCallback: ((String)->())?
    var successCallback: (()->())?
    
    func getNowPlaying() {
        manager.getCategoryMovies(type: .nowPlaying) { movies in
            if let movies = movies {
                self.nowPlayingItems = movies.results!
                self.successCallback?()

            }
        } onError: { error in
            print("Error while getting .nowPlaying list \(error)")
        }

    }
    func getPopular() {
        manager.getCategoryMovies(type: .popular) { movies in
            self.movies = movies
            
        } onError: { error in
            print("Error while getting CategoryMovies list \(error)")
            
        }

    }
}

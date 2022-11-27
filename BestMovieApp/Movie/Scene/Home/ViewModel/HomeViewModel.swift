//
//  HomeViewModel.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import Foundation

class HomeViewModel {
    
    let manager = HomeManager.shared
    
    
    var nowPlayingItems = [MovieResult]()
    var popularItems = [MovieResult]()
    var latestItems = [MovieResult]()
    var topRatedItems = [MovieResult]()
    var upComingItems = [MovieResult]()
    var movieCategory: MovieCategory?
    var categoryData = [MovieResult]()
    var errorCallback: ((String)->())?
    var successCallback: (()->())?
    
    
    //MARK: - Getting data to Model
    
    func getCategory(type: MovieCategory) {
        manager.getCategoryMovies(type: type) { movies in
            if let movies = movies {
                self.popularItems = movies.results!
                self.successCallback?()
            }
        } onError: { error in
            print("Error while getting data from filterView \(error)")
        }
        
    }
    
    func getNowPlaying() {
        manager.getCategoryMovies(type: .nowPlaying) { movies in
            if let movies = movies {
                self.nowPlayingItems = movies.results ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("Error while getting .nowPlaying list \(error)")
        }
    }
    
    func getPopular() {
        manager.getCategoryMovies(type: .popular) { movies in
            if let movies = movies {
                self.popularItems = movies.results ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("Error while getting PopularMovies list \(error)")
        }
    }
    
    func getTopRated() {
        manager.getCategoryMovies(type: .topRated) { movies in
            if let movies = movies {
                self.topRatedItems = movies.results ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("Error while getting TopRatedMovies list \(error)")
        }
    }
    
    func getUpComimg() {
        manager.getCategoryMovies(type: .upcoming) { movies in
            if let movies = movies {
                self.upComingItems = movies.results ?? []
                self.successCallback?()
            }
            
        } onError: { error in
            print("Error while getting UpComingMovies list \(error)")
            
        }
        
    }
    
}

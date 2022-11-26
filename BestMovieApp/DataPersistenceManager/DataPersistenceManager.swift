//
//  DataPersistenceManager.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 25.11.2022.
//

import Foundation
import UIKit
import CoreData

enum DataBaseError: Error {
    case failedToSaveData
    case failedToFetchData
    case failedToDeleteData
}

class DataPersistenceManager {
    
    static let shared = DataPersistenceManager()
    
    
    //MARK: - Persistent Container
    
    func watchListMovieResultWith(model: MovieResult, completion: @escaping ((Result<Void, Error>)->Void)) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = MovieResultItem(context: context)
        
        item.originalTitle = model.originalTitle
        item.id = Int64(model.id!)
        item.overview = model.overview
        item.posterPath = model.posterPath
        item.voteAverage = model.voteAverage!
        item.backdropPath = model.backdropPath
        item.releaseDate = model.releaseDate
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            print(completion(.failure(DataBaseError.failedToSaveData)))
        }
        
    }
    
    
    //MARK: - Context manager
    
    func fetchingWatchListFromDataBase(completion: @escaping (Result<[MovieResultItem], Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<MovieResultItem>
        
        request = MovieResultItem.fetchRequest()
        
        do {
            try context.save()
            let movies = try context.fetch(request)
            completion(.success(movies))
            
            
        } catch {
            completion(.failure(DataBaseError.failedToFetchData))
            
        }
        
    }
    
    //MARK: - Delete item from localstorage
    
    func deleteWatchlistWith(model: MovieResultItem, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DataBaseError.failedToDeleteData))
            
        }
        
    }
}

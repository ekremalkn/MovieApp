//
//  WatchListController.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import UIKit
import SwipeCellKit

class WatchListController: UIViewController {
    
    private var watchListMovies: [MovieResultItem] = [MovieResultItem]()
    @IBOutlet private weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        collectionSetup()
        fetchLocalStorageForWatchList()
        NotificationCenter.default.addObserver(forName: NSNotification.Name("Added to Watchlist"), object: nil, queue: nil) { _ in
            self.fetchLocalStorageForWatchList()
        }
    }
    
    //MARK: - UI
    
    private func configureViewController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    private func collectionSetup() {
        collection.register(UINib(nibName: "\(WatchListMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(WatchListMovieCell.self)")
    }
    
    
    
    //MARK: - FetchLocalStroage
    
    private func fetchLocalStorageForWatchList() {
        DataPersistenceManager.shared.fetchingWatchListFromDataBase { result in
            switch result {
            case .success(let watchListMovies):
                self.watchListMovies = watchListMovies
                self.collection.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
}

//MARK: - CollectionViewMethods

extension WatchListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, SwipeCollectionViewCellDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("\(watchListMovies.count)ekrem")
        
        return watchListMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(WatchListMovieCell.self)", for: indexPath) as! WatchListMovieCell
        cell.delegate = self as? SwipeCollectionViewCellDelegate
        cell.configureWatchList(data: watchListMovies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = DetailViewController()
        let bundle = Bundle(for: type(of: controller))
        bundle.loadNibNamed("DetailViewController", owner: controller, options: nil)
        self.navigationController?.show(controller, sender: nil)
        controller.configureInWatchList(data: watchListMovies[indexPath.row])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            
            DataPersistenceManager.shared.deleteWatchlistWith(model: self.watchListMovies[indexPath.row]) { result in
                switch result {
                case .success():
                    print("deleted from the database")
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
                self.watchListMovies.remove(at: indexPath.row)
                collectionView.deleteItems(at: [indexPath])
            }
            
            
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "favorite")
        
        return [deleteAction]
    }
 
}


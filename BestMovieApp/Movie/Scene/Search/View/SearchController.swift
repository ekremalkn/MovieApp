//
//  SearchController.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import UIKit

class SearchController: UIViewController {
    
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var collection: UICollectionView!
    
    var searchViewModel = SearchViewModel()
    var filteredData = [MovieResult]()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchViewModel.getMovies()
        collectionSetup()
        viewModelConfiguration()
        
    }
    
    private func collectionSetup() {
        collection.register(UINib(nibName: "\(SearchMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(SearchMovieCell.self)")
    }
    
    
    private func viewModelConfiguration() {
        searchViewModel.successCallback = { [weak self] in
            self?.collection.reloadData()
            
        }
        
        
        
    }
    
}

//MARK: - SearchBarMethods

extension SearchController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
    }
    
}

//MARK: - CollectionViewMethods

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchViewModel.movieItems.count
 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SearchMovieCell.self)", for: indexPath) as! SearchMovieCell
        cell.layer.cornerRadius = 16
        cell.configure(data: searchViewModel.movieItems[indexPath.row])
        return cell
        
    }
    
    
}

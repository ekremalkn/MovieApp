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
    
    private var searchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel.text = searchText
        searchViewModel.getMovies()
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dismiss(animated: true) {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailController") as! DetailViewController
            self.present(controller, animated: true, completion: nil)
            controller.configure(data: self.searchViewModel.movieItems[indexPath.row])
            
        }
        
    }
    
}



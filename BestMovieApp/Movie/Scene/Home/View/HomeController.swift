//
//  ViewController.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetup()
        viewModelConfiguration()
    }
    
    private func collectionSetup() {
        collectionView.register(UINib(nibName: "\(TopMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(TopMovieCell.self)")
    }
    
    private func viewModelConfiguration() {
        homeViewModel.getCategoryItems()
        
    }
    

   
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.movies?.results?.count ?? 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TopMovieCell.self)", for: indexPath) as! TopMovieCell
        print(homeViewModel.movies?.results?[indexPath.item].title ?? "")
        if let movie = homeViewModel.movies?.results?[indexPath.item] {
            cell.configure(data: movie)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 365)
    }
    
}




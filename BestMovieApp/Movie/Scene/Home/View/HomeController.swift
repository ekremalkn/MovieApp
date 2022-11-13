//
//  ViewController.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet private weak var collection: UICollectionView!
    
     var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetup()
        viewModelConfiguration()
    }
    
    private func collectionSetup() {
        collection.register(UINib(nibName: "\(TopMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(TopMovieCell.self)")
        collection.register(UINib(nibName: "\(HomeHeader.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HomeHeader.self)")
    }
    
    private func viewModelConfiguration() {
        homeViewModel.getPopuler()
        homeViewModel.getNowPlaying()
        collection.reloadData()
        
    }
    

   
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.movies?.results?.count ?? 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TopMovieCell.self)", for: indexPath) as! TopMovieCell
        if let movie = homeViewModel.movies?.results?[indexPath.item] {
            cell.configure(data: movie)
            }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HomeHeader.self)", for: indexPath) as! HomeHeader
        header.configure(data: homeViewModel.nowPlayingItems)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
       return CGSize(width: collectionView.frame.width, height: 365)
    }
    
}




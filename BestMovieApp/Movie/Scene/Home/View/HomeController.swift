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
        collection.register(UINib(nibName: "\(HorizontalMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HorizontalMovieCell.self)")
        collection.register(UINib(nibName: "\(HomeHeader.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HomeHeader.self)")
        
    }
    
    private func viewModelConfiguration() {
        homeViewModel.getPopular()
        homeViewModel.getNowPlaying()
        homeViewModel.successCallback = { [weak self] in
            self?.collection.reloadData()
            
        }
    }
}

//MARK: - CollectionViewMethods

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.popularItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HorizontalMovieCell.self)", for: indexPath) as! HorizontalMovieCell
        cell.layer.cornerRadius = 25
        cell.configure(data: homeViewModel.popularItems[indexPath.row])
        
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HomeHeader.self)", for: indexPath) as! HomeHeader
        header.configure(data: homeViewModel.nowPlayingItems)
        return header
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dismiss(animated: true) {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailController") as! DetailViewController
            self.present(controller, animated: true, completion: nil)
            controller.configure(data: self.homeViewModel.popularItems[indexPath.row])
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 365)
    }
    
    
    
    
}




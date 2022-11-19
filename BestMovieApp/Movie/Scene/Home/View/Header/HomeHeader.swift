//
//  HomeHeader.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 13.11.2022.
//

import UIKit
import SDWebImage

class HomeHeader: UICollectionReusableView {
    @IBOutlet private weak var collection: UICollectionView!
    
    var items = [MovieResult]()
    
    override func layoutSubviews() {
        collection.register(UINib(nibName: "\(VerticalMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(VerticalMovieCell.self)")
    }
   
    func configure(data: [MovieResult]) {
        items = data
        collection.reloadData()
    }
    
    }

//MARK: - CollectionViewMethods

extension HomeHeader: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(VerticalMovieCell.self)", for: indexPath) as! VerticalMovieCell
        cell.configure(data: items[indexPath.item])
        cell.layer.cornerRadius = 25
        return cell
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 143 / 375
        let height = collectionView.frame.height * 283 / 812
        return CGSize(width: width, height: collectionView.frame.height)
    }
  
    
    
}
    
    
    
    

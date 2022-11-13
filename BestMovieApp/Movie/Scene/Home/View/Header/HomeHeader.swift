//
//  HomeHeader.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 13.11.2022.
//

import UIKit

class HomeHeader: UICollectionReusableView {
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var topView: UIView!
    
    var items = [MovieResult]()
    
    override func layoutSubviews() {

        collection.register(UINib(nibName: "\(VerticalMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(VerticalMovieCell.self)")
    }
    
    func configure(data: [MovieResult]) {
        items = data
        collection.reloadData()
        
    }
    
    }
    




extension HomeHeader: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(VerticalMovieCell.self)", for: indexPath) as! VerticalMovieCell
        cell.configure(data: items[indexPath.item])
        return cell
    }
    
}
    
    
    
    

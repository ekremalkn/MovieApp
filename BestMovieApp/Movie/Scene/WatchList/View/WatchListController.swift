//
//  WatchListController.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import UIKit

class WatchListController: UIViewController {
    
    @IBOutlet private weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       collectionSetup()
    }
    
    private func collectionSetup() {
        collection.register(UINib(nibName: "\(WatchListMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(WatchListMovieCell.self)")
    }
    
    
    private func viewModelConfiguration() {
        
    }

}

//MARK: - CollectionViewMethods

extension WatchListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(WatchListMovieCell.self)", for: indexPath) as! WatchListMovieCell
        return cell
    }
    
    
    
    
    
}


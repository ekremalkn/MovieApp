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
    
    //MARK: - FilterButton show FilterController
    
    @IBAction func showFilterTableView(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "\(FilterController.self)") as! FilterController
        controller.selectionCallback = { category in
            self.homeViewModel.getCategory(type: category)
        }
        self.presentPanModal(controller)
    }
    
    //MARK: - Registering UINib's
    
    private func collectionSetup() {
        collection.register(UINib(nibName: "\(HorizontalMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HorizontalMovieCell.self)")
        collection.register(UINib(nibName: "\(HomeHeader.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HomeHeader.self)")
    }
    
    //MARK: - ViewModelConfigure
    
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
        let controller = DetailViewController()
        let bundle = Bundle(for: type(of: controller))
        bundle.loadNibNamed("DetailViewController", owner: controller, options: nil)
        self.navigationController?.show(controller, sender: nil)
        controller.getDataForWathcList(data: homeViewModel.popularItems[indexPath.row])
        controller.configure(data: homeViewModel.popularItems[indexPath.row])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 365)
    }

}





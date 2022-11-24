//
//  DetailViewController.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 19.11.2022.
//

import UIKit
import SDWebImage

protocol DetailMovieViewProtocol {
    var detailViewBigImage: String { get }
    var detailViewSmallImage: String { get }
    var detailViewTitle: String { get }
    var detailViewRate: String { get }
    var detailViewRelease: String { get }
    var detailViewOverview: String { get }
    var detailViewId: Int { get }
    
}

class DetailViewController: UIViewController {
    
    
    var detailViewModel = DetailViewModel()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstMovieImage: UIImageView!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var secondMovieImage: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
     
    @IBOutlet weak var favoriteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Action Buttons
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        favoriteButton.isSelected.toggle()
    }
    
    
    @IBAction func openDetailLink(_ sender: Any) {
        UIApplication.shared.open(URL(string: (detailViewModel.detailMovieLink?.ca?.link)!)!)
    }
    
    //MARK: - UI Button Configure
    func configureUI() {
        let image = UIImage(named: "favorite")
        let imageFilled = UIImage(named: "favorite-filled")
        favoriteButton.setImage(image, for: .normal)
        favoriteButton.setImage(imageFilled, for: .selected)
    }

    func configure(data: DetailMovieViewProtocol) {
        configureUI()
        
        detailViewModel.id = data.detailViewId
        detailViewModel.getDetailLink()
        
        titleLabel.text = data.detailViewTitle
        releaseLabel.text = data.detailViewRelease
        rateLabel.text = data.detailViewRate
        overviewLabel.text = data.detailViewOverview
        firstMovieImage.sd_setImage(with: URL(string: data.detailViewBigImage))
        secondMovieImage.sd_setImage(with: URL(string: data.detailViewSmallImage))
        secondMovieImage.layer.cornerRadius = 16
    }
    
   
    
  
}

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
    var movieArray: MovieResult?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstMovieImage: UIImageView!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var secondMovieImage: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    @IBOutlet weak var backgroundImage: UIView!
    @IBOutlet weak var favoriteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Action Buttons
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        favoriteButton.isSelected = !favoriteButton.isSelected
        if favoriteButton.isSelected == true {
            DataPersistenceManager.shared.watchListMovieResultWith(model: movieArray!) { result in
                switch result {
                case .success():
                    NotificationCenter.default.post(name: NSNotification.Name("Added to Watchlist"), object: nil)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } else {
            return
        }
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
    
    
    
    //MARK: - Getting data from didSelectItemAt
    
    func getDataForWathcList(data: MovieResult) {
        movieArray = data
    }
    
    //MARK: - Configure variables
    
    func configureInWatchList(data: MovieResultItem) {
        
        
        titleLabel.text = data.originalTitle
        rateLabel.text = "\(data.voteAverage)"
        releaseLabel.text = data.releaseDate
        overviewLabel.text = data.overview
        firstMovieImage.sd_setImage(with: URL(string:"https://image.tmdb.org/t/p/original/\(data.posterPath!)" ))
        secondMovieImage.sd_setImage(with: URL(string:"https://image.tmdb.org/t/p/original/\(data.posterPath!)" ))
        secondMovieImage.layer.cornerRadius = 16
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


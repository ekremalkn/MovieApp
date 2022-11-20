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
    
}

class DetailViewController: UIViewController {
    @IBOutlet weak var bigMovieImage: UIImageView!
    @IBOutlet weak var smallMovieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func configure(data: DetailMovieViewProtocol) {
        titleLabel.text = data.detailViewTitle
        releaseLabel.text = data.detailViewRelease
        rateLabel.text = data.detailViewRate
        overviewLabel.text = data.detailViewOverview
        bigMovieImage.sd_setImage(with: URL(string: data.detailViewBigImage))
        smallMovieImage.sd_setImage(with: URL(string: data.detailViewSmallImage))
        smallMovieImage.layer.cornerRadius = 16
    }
    
}

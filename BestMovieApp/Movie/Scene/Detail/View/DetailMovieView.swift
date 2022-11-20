//
//  DetailMovieView.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 20.11.2022.
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
class DetailMovieView: UIView {
    @IBOutlet var detailView: UIView!
    
    @IBOutlet weak var bigMovieImage: UIImageView!
    @IBOutlet weak var smallMovieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("DetailMovieView", owner: self, options: nil)
        addSubview(detailView)
        detailView.frame = self.bounds
        detailView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    
    

    func configure(data: DetailMovieViewProtocol) {
        titleLabel.text = data.detailViewTitle
        releaseLabel.text = data.detailViewRelease
        rateLabel.text = data.detailViewRate
        overviewLabel.text = data.detailViewOverview
        bigMovieImage.sd_setImage(with: URL(string: data.detailViewBigImage))
        smallMovieImage.sd_setImage(with: URL(string: data.detailViewSmallImage))
    }
}

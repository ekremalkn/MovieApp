//
//  TopMovieCell.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.∫
//

import UIKit
import SDWebImage
protocol HorizontalMovieCellProtocol {
    var posterImage: String { get }
    var titleText: String { get }
    var releaseText: String { get }
    var ratingText: String { get }
}
class TopMovieCell: UICollectionViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var movieImage1: UIImageView!
   
    
    func configure(data: HorizontalMovieCellProtocol) {
        titleLabel.text = data.titleText
        ratingLabel.text = data.ratingText
        releaseLabel.text = data.releaseText
        movieImage1.sd_setImage(with: URL(string: data.posterImage)!)
     
    }
    
    
    
    
}

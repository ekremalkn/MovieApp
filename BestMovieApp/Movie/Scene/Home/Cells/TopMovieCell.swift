//
//  TopMovieCell.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.∫
//

import UIKit
import SDWebImage
protocol MovieCellProtocol {
    var posterImage: String { get }
    var titleText: String { get }
    var releaseText: String { get }
    var ratingText: String { get }
}
class TopMovieCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet private weak var movieImage1: UIImageView!
   
    
    func configure(data: MovieCellProtocol) {
        titleLabel.text = data.titleText
        ratingLabel.text = data.ratingText
        releaseLabel.text = data.releaseText
        movieImage1.sd_setImage(with: URL(string: data.posterImage)!)
        
        
        
     
    }
    
    
}

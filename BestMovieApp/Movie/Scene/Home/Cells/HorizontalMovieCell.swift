//
//  HorizontalMovieCell.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 14.11.2022.
//

import UIKit
import SDWebImage
protocol HorizontalMovieCellProtocol {
    var horizontalCellImage: String { get }
    var horizontalCellTitle: String { get }
    var horizontalCellRelease: String { get }
    var horizontalCellRating: String { get }
}
class HorizontalMovieCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
    
    
    func configure(data: HorizontalMovieCellProtocol) {
        titleLabel.text = data.horizontalCellTitle
        ratingLabel.text = data.horizontalCellRating
        releaseLabel.text = data.horizontalCellRelease
        movieImage.sd_setImage(with: URL(string: data.horizontalCellImage)!)
        movieImage.layer.cornerRadius = 15
        
    }
}

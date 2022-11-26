//
//  VerticalMovieCell.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 13.11.2022.
//

import UIKit
import SDWebImage
protocol VerticalMovieCellProtocol {
    var verticalCellImage: String { get }
    var verticalCellTitle: String { get }
    var verticalCellRelease: String { get }
}
class VerticalMovieCell: UICollectionViewCell {
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseLabel: UILabel!
    
    func configure(data: VerticalMovieCellProtocol) {
        titleLabel.text = data.verticalCellTitle
        releaseLabel.text = data.verticalCellRelease
        movieImage.sd_setImage(with: URL(string: data.verticalCellImage))
        movieImage.layer.cornerRadius = 25
    }
    
    
    
}

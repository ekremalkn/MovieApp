//
//  VerticalMovieCell.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 13.11.2022.
//

import UIKit
import SDWebImage
protocol VerticalMovieCellProtocol {
    var headerImage: String { get }
    var headerTitle: String { get }
    var headerRelease: String { get }
}
class VerticalMovieCell: UICollectionViewCell {
    @IBOutlet private weak var movieImage2: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseLabel: UILabel!
    
    func configure(data: VerticalMovieCellProtocol) {
        titleLabel.text = data.headerTitle
        releaseLabel.text = data.headerRelease
        movieImage2.sd_setImage(with: URL(string: data.headerImage))
    }
    
    

}

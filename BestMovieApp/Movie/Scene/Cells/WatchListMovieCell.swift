//
//  WatchListMovieCell.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 24.11.2022.
//

import UIKit
import SDWebImage
import SwipeCellKit


class WatchListMovieCell: SwipeCollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configureWatchList(data: MovieResultItem) {
        titleLabel.text = data.originalTitle
        rateLabel.text = "\(data.voteAverage)"
        releaseLabel.text = data.releaseDate
        movieImage.sd_setImage(with: URL(string:"https://image.tmdb.org/t/p/original/\(data.posterPath!)" ))
        movieImage.layer.cornerRadius = 16
    }
   
}

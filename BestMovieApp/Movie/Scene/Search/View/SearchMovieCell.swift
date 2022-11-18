//
//  SearchMovieCell.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 18.11.2022.
//

import UIKit
import SDWebImage

protocol SearchMovieCellProtocol {
    var searchCellImage: String { get }
    var searchCellTitle: String { get }
}
class SearchMovieCell: UICollectionViewCell {
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(data: SearchMovieCellProtocol) {
        titleLabel.text = data.searchCellTitle
        movieImage.sd_setImage(with: URL(string: data.searchCellImage))
        movieImage.layer.cornerRadius = 16
    }
       
    }



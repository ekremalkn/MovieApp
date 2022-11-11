//
//  TopMovieCell.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 11.11.2022.
//

import UIKit
import Alamofire
import AlamofireImage

protocol TopMovieCellProtocol {
    var posterImage: String { get }
    
}
class TopMovieCell: UICollectionViewCell {

    @IBOutlet private weak var movieImage1: UIImageView!
    @IBOutlet private weak var movieImage2: UIImageView!
    @IBOutlet private weak var movieImage3: UIImageView!
    
    
    func configure(data: TopMovieCellProtocol) {
        
        AF.request(URL(string: data.posterImage)!) { response in
            print(response)
        }
    }
    
    
}

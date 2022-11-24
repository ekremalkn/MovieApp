//
//  DetailViewModel.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 24.11.2022.
//

import Foundation

class DetailViewModel {
    let manager = DetailManager.shared
    
    var id: Int!
    var detailMovieLink: DetailMovie?

    var successCallback: (()->())?
    
    func getDetailLink() {
        manager.getDetailItems(id: id!) { detailMovie in
            if let detailMovie = detailMovie {
                self.detailMovieLink = detailMovie.results
                self.successCallback?()
            }
            
        } onError: { error in
            print("Error while getting detailMovieLink \(error)")
        }


        
    }
}

//
//  FilterViewModel.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 27.11.2022.
//

import Foundation

class FilterViewModel {
    var items = [FilterModel(title: "Popular", type: .popular),
                 FilterModel(title: "Upcoming", type: .upcoming),
                 FilterModel(title: "Top Rated", type: .topRated),
                 FilterModel(title: "Now Playing", type: .nowPlaying)
                       ]
    
}

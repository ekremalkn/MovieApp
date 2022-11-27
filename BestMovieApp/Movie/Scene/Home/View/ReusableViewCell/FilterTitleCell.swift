//
//  FilterTitleCell.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 27.11.2022.
//

import UIKit

class FilterTitleCell: UITableViewCell {
    
    @IBOutlet  weak var filterTitleLabel: UILabel!
    
    
    func configure(title: String) {
        filterTitleLabel.text = title
    }
}

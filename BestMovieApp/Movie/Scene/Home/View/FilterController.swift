//
//  FilterController.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 27.11.2022.
//

import UIKit
import PanModal

class FilterController: UIViewController {
    
    @IBOutlet private weak var table: UITableView!
    
    var viewmodel = FilterViewModel()
    
    var selectionCallback: ((MovieCategory) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib(nibName: "\(FilterTitleCell.self)", bundle: nil), forCellReuseIdentifier: "\(FilterTitleCell.self)")
        
        
        
    }
    
    
    
}

extension FilterController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FilterTitleCell.self)", for: indexPath) as! FilterTitleCell
        cell.configure(title: viewmodel.items[indexPath.row].title)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) {
            self.selectionCallback?(self.viewmodel.items[indexPath.row].type)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    
    
}

extension FilterController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(260)
    }
    
}

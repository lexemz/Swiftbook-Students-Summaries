//
//  Extension+UITableView.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 16/09/2021.
//

import UIKit

extension UITableView {
    // Remove empty rows at the end in TableView
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        tableFooterView = UIView()
    }
}

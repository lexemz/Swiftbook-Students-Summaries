//
//  Extension+UITableView.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 16/09/2021.
//

import UIKit

extension UITableView {
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.tableFooterView = UIView()
    }
}

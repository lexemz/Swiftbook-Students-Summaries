//
//  NadiaDefaultTableViewCell.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 16/09/2021.
//

import UIKit

class NadiaDefaultTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var additionalLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!

    // MARK: - Public methods
    func setUpCellWith(title: String, text: String?) {
        if let description = text {
            additionalLabel.text = description
        } else {
            additionalLabel.isHidden = true
        }
        mainLabel.text = title
    }
}

//
//  NadiaDefaultTableViewCell.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 16/09/2021.
//

import UIKit

class NadiaDefaultTableViewCell: UITableViewCell {

    @IBOutlet weak var additionalLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!

    
    func setUpCellWith(title: String, text: String?) {
        if let description = text {
            additionalLabel.isHidden = false
            additionalLabel.text = description
        } else {
            additionalLabel.isHidden = true
        }
        mainLabel.text = title
    }

}

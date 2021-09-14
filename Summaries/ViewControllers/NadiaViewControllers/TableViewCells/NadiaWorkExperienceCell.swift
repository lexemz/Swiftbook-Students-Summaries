//
//  NadiaWorkExperienceCell.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 12/09/2021.
//

import UIKit

class NadiaWorkExperienceCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    // MARK: - Public methods
    func setUpCell(for work: WorkPlaceN) {
        periodLabel.text = "\(work.dateOfStart) - \(work.dateOfFinishing)"
        positionLabel.text = work.position
        descriptionLabel.text = work.description
    }
}

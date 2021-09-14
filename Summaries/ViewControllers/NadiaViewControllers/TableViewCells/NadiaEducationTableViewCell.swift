//
//  NadiaEducationTableViewCell.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 12/09/2021.
//

import UIKit

class NadiaEducationTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var specializationLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var levelDegreeLabel: UILabel!

    // MARK: - Public methods
    func setUpCell(for education: EducationN) {
        specializationLabel.text = education.specialization
        periodLabel.text = "\(education.dateOfStart) - \(education.dateOfFinishing)"
        levelDegreeLabel.text = education.levelDegree.rawValue
    }

}

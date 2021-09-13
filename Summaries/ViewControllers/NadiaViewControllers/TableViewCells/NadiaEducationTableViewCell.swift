//
//  NadiaEducationTableViewCell.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 12/09/2021.
//

import UIKit

class NadiaEducationTableViewCell: UITableViewCell {
    @IBOutlet weak var instituteNameLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var levelDegreeLabel: UILabel!
    @IBOutlet weak var specialization: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpCell(for education: EducationN) {
        instituteNameLabel.text = education.name
        periodLabel.text = "\(education.dateOfStart) - \(education.dateOfFinishing)"
        levelDegreeLabel.text = education.levelDegree.rawValue
        specialization.text = education.specialization
    }

}

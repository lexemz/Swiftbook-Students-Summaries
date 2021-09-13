//
//  NadiaWorkExperienceCell.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 12/09/2021.
//

import UIKit

class NadiaWorkExperienceCell: UITableViewCell {
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpCell(for work: WorkPlaceN) {
        placeLabel.text = work.company
        periodLabel.text = "\(work.dateOfStart) - \(work.dateOfFinishing)"
        positionLabel.text = work.position
        descriptionLabel.text = work.description
    }


}

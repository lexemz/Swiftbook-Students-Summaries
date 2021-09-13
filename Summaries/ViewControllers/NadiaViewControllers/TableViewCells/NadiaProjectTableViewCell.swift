//
//  NadiaProjectTableViewCell.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 12/09/2021.
//

import UIKit

class NadiaProjectTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var gitLinkLabel: UILabel!
    @IBOutlet weak var appStoreLinkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpCell(for project: ProjectN) {
        titleLabel.text = project.title
        descriptionLabel.text = project.description
        gitLinkLabel.text = project.linkGit != nil ?
            "Git link: provided" :
            "Git link: n/a"
        appStoreLinkLabel.text = project.linkAppStore != nil ?
            "AppStore link: provided" :
            "AppStore link: n/a"
    }

}

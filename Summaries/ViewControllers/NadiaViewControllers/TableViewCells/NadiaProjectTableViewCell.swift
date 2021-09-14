//
//  NadiaProjectTableViewCell.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 12/09/2021.
//

import UIKit

class NadiaProjectTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var gitLinkLabel: UILabel!
    @IBOutlet weak var appStoreLinkLabel: UILabel!

    // MARK: - Public methods
    func setUpCell(for project: ProjectN) {
        titleLabel.text = project.title
        descriptionLabel.text = project.description
        gitLinkLabel.text = project.linkGit != nil ?
            "Git link: ✔︎" :
            "Git link: ✘"
        appStoreLinkLabel.text = project.linkAppStore != nil ?
            "AppStore link: ✔︎" :
            "AppStore link: ✘"
    }
}

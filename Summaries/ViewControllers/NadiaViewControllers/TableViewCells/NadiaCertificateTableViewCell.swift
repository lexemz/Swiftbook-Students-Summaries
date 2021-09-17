//
//  NadiaCertificateTableViewCell.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 12/09/2021.
//

import UIKit

class NadiaCertificateTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var issuedDateLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    // MARK: - Public methods
    func setUpCell(for certificate: CertificateN) {
        companyLabel.text = certificate.company
        issuedDateLabel.text = certificate.dateOfIssue
        linkLabel.text = certificate.certificateLink != "" ? " ✔︎ Certificate confirmed" : ""
    }
}

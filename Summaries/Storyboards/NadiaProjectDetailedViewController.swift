//
//  NadiaProjectDetailedViewController.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 13/09/2021.
//

import UIKit

class NadiaProjectDetailedViewController: UITableViewController {
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var gitLinkLabel: UILabel!
    @IBOutlet weak var appstoreLinkLabel: UILabel!
    var project: ProjectN!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        title = project.title
    }
    
    private func setUpUI() {
        previewImage.image = UIImage(named: project.image ?? "nadiaPreviewPlaceholder")
        descriptionLabel.text = project.description
        gitLinkLabel.text = project.linkGit
        appstoreLinkLabel.text = project.linkAppStore
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            guard let string = project.linkAppStore, let url = URL(string: string) else { return }
            
                UIApplication.shared.open(url)
        
        } else if indexPath.row == 3 {
            guard let string = project.linkGit, let url = URL(string: string) else { return }
            
                UIApplication.shared.open(url)
        
        }
    }
}

//
//  NadiaProjectDetailedViewController.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 13/09/2021.
//

import UIKit

class NadiaProjectDetailedViewController: UITableViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var gitLinkLabel: UILabel!
    @IBOutlet weak var appstoreLinkLabel: UILabel!
    
    // MARK: - Public properties
    var project: ProjectN!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        title = project.title
        navigationController?.navigationBar.topItem?.backButtonTitle = "Back"
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            guard let string = project.linkAppStore, let url = URL(string: string) else { return }
            UIApplication.shared.open(url)
        } else if indexPath.row == 3 {
            guard let string = project.linkGit, let url = URL(string: string) else { return }
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedVC = segue.destination as? NadiaDetailedImageViewController else { return }
        detailedVC.imageFullSize = project.image
    }
    
    // MARK: - Private methods
    private func setUpUI() {
        previewImage.image = UIImage(named: project.image ?? "nadiaPreviewPlaceholder")
        descriptionLabel.text = project.description
        gitLinkLabel.text = project.linkGit != nil ?
            "✔︎ GitHub: Click to open" :
            "✘ GitHub link is not available"
        appstoreLinkLabel.text = project.linkAppStore != nil ?
            "✔︎ AppStore: Click to open" :
            "✘ AppStore link is not available"
    }
}

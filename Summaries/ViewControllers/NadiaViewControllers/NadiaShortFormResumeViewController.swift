//
//  NadiaShortFormResumeViewController.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 16/09/2021.
//

import UIKit

class NadiaShortFormResumeViewController: UITableViewController {
    // MARK: - Public Properties
    var person: PersonN!
    
    // MARK: - Private Properties
    private var selectedDetailedInfo: DetailedInfoN? = nil
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = person.fullname
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shortFormCell", for: indexPath)
        var contentConfig = cell.defaultContentConfiguration()
        switch indexPath.row {
        case 0: contentConfig.text = "📖 Personal Info"
        case 1: contentConfig.text = "🏢 Work Experience"
        case 2: contentConfig.text = "🛠 Skills"
        case 3: contentConfig.text = "🧑🏻‍🎓 Education"
        case 4:contentConfig.text = "🎖 Certificates"
        case 5: contentConfig.text = "🎯 Projects"
        case 6: contentConfig.text = "Other Information"
        default: contentConfig.text = "More"
        }
        contentConfig.textProperties.font = UIFont(name: "MuktaMahee Bold", size: 17)
            ?? UIFont.systemFont(ofSize: 17)
        
        cell.contentConfiguration = contentConfig
        cell.backgroundColor = .systemGray6
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: selectedDetailedInfo = .personalInfo
        case 1: selectedDetailedInfo = .work
        case 2: selectedDetailedInfo = .skills
        case 3: selectedDetailedInfo = .education
        case 4: selectedDetailedInfo = .certificate
        case 5: selectedDetailedInfo = .project
        case 6: selectedDetailedInfo = .additionalInfo
        default: return
        }
        performSegue(withIdentifier: "detailedInformation", sender: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedVC = segue.destination as? NadiaDetailedInfoViewController else { return }
        detailedVC.person = person
        detailedVC.typeInfo = selectedDetailedInfo
    }
}

//
//  NadiaMainResumeViewController.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 11/09/2021.
//

import UIKit

class NadiaMainResumeViewController: UITableViewController {
    // MARK: - Public Properties
    var person: PersonN!
    
    // MARK: - Private Properties
    private var selectedDetailedInfo: DetailedInfoN? = nil
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = person.fullname
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 7
        case 1: return person.workPlaces?.count ?? 0
        case 2: return 1
        case 3: return person.education?.count ?? 0
        case 4: return person.certificates?.count ?? 0
        case 5:return person.projects?.count ?? 0
        case 6: return person.additionalInfo.count
        default: return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainNadiaResumeCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                content.text = "Date of Birth:"
                content.secondaryText = person.dateOfBirth
            case 1:
                content.text = "Address:"
                content.secondaryText = person.address
            case 2:
                content.text = "Position:"
                content.secondaryText = person.expectedPosition
            case 3:
                content.text = "Summary:"
                content.secondaryText = person.summary
            case 4:
                let languages = person.languages.map{$0.language}.joined(separator: ", ")
                content.text = "Languages:"
                content.secondaryText = languages
            case 5:
                content.text = "Phone:"
                content.secondaryText = person.contactInfo.phoneNumber
            case 6:
                content.text = "Email:"
                content.secondaryText = person.contactInfo.email
            default: break
            }
            cell.accessoryType = .none
        case 1:
            guard let work = person.workPlaces?[indexPath.row] else { break }
            content.text = "\(work.company)"
            content.textProperties.alignment = .justified
            content.secondaryText = "\(work.position)"
            cell.accessoryType = .disclosureIndicator
            
        case 2:
            let skills = person.skills.joined(separator: ", ")
            content.text = skills
            cell.accessoryType = .none
        case 3:
            guard let education = person.education?[indexPath.row] else { break }
            content.text = education.name
            content.secondaryText = "\(education.levelDegree.rawValue), \(education.specialization)"
            cell.accessoryType = .disclosureIndicator
        case 4:
            guard let certificate = person.certificates?[indexPath.row] else { break }
            content.text = certificate.title
            content.secondaryText = certificate.dateOfIssue
            cell.accessoryType = .disclosureIndicator
        case 5:
            guard let project = person.projects?[indexPath.row] else { break }
            content.text = project.title
            content.secondaryText = project.description
            cell.accessoryType = .disclosureIndicator
        case 6:
            let info = person.additionalInfo[indexPath.row]
            content.text = info.title
            content.secondaryText  = info.description
            cell.accessoryType = .none
        default:
            content.text = "There is no any information."
            cell.accessoryType = .none
        }
        
        content.textProperties.font = UIFont(name: "MuktaMahee Bold", size: 17)
            ?? UIFont.systemFont(ofSize: 17)
        content.secondaryTextProperties.color = .darkGray
        content.secondaryTextProperties.font = UIFont(name: "MuktaMahee Bold", size: 15)
            ?? UIFont.systemFont(ofSize: 15)
        
        cell.contentConfiguration = content
        cell.backgroundColor = .systemGray6
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "📖 Personal Info"
        case 1: return "🏢 Work Experience"
        case 2: return "🛠 Skills"
        case 3: return "🧑🏻‍🎓 Education"
        case 4: return "🎖 Certificates"
        case 5: return "🎯 Projects"
        case 6: return "Other Information"
        default: return "More"
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        var contentConfig = header.defaultContentConfiguration()
        contentConfig.textProperties.font = UIFont(name: "MuktaMahee Bold", size: 18)
            ?? UIFont.systemFont(ofSize: 18)
        switch section {
        case 0: contentConfig.text = "📖 Personal Info"
        case 1: contentConfig.text = "🏢 Work Experience"
        case 2: contentConfig.text = "🛠 Skills"
        case 3: contentConfig.text = "🧑🏻‍🎓 Education"
        case 4:contentConfig.text = "🎖 Certificates"
        case 5: contentConfig.text = "🎯 Projects"
        case 6: contentConfig.text = "Other Information"
        default: contentConfig.text = "More"
        }
        contentConfig.textProperties.color = UIColor.white
        header.contentConfiguration = contentConfig
        
        var backgroundConfig = UIBackgroundConfiguration.listPlainHeaderFooter()
        backgroundConfig.backgroundColor = .darkGray
        header.backgroundConfiguration = backgroundConfig
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0, 2, 6: return
        case 1: selectedDetailedInfo = .work
        case 3: selectedDetailedInfo = .education
        case 4: selectedDetailedInfo = .certificate
        case 5: selectedDetailedInfo = .project
        default: return
        }
        performSegue(withIdentifier: "detailedInfoN", sender: (person, selectedDetailedInfo))
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedVC = segue.destination as? NadiaDetailedInfoViewController else { return }
        detailedVC.person = person
        detailedVC.typeInfo = selectedDetailedInfo
    }
    
    
}

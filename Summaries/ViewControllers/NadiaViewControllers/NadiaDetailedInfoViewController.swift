//
//  DetailedInfoViewController.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 12/09/2021.
//

import UIKit

class NadiaDetailedInfoViewController: UITableViewController {
    // MARK: - Public Properties
    var typeInfo: DetailedInfoN!
    var person: PersonN!
    
    //     MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTitle()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        var numberOfRows = 1
        switch typeInfo {
        case .project: numberOfRows = person.projects?.count ?? 1
        case .work: numberOfRows = person.workPlaces?.count ?? 1
        case .certificate: numberOfRows = person.certificates?.count ?? 1
        case .education: numberOfRows = person.education?.count ?? 1
        case .none, .personalInfo, .skills, .additionalInfo: break
        }
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = 1
        switch typeInfo {
        case .personalInfo: numberOfRows = 7
        case .skills: numberOfRows = person.skills.count
        case .additionalInfo: numberOfRows = person.additionalInfo.count
        case .work, .certificate, .project, .education, .none: break
        }
        return numberOfRows
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch typeInfo {
        case .personalInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultResumeCell", for: indexPath) as! NadiaDefaultTableViewCell
            switch indexPath.row {
            case 0:
                cell.setUpCellWith(title: "Date of Birth:", text: person.dateOfBirth)
            case 1:
                cell.setUpCellWith(title: "Address:", text: person.address)
            case 2:
                cell.setUpCellWith(title: "Position:", text: person.expectedPosition)
            case 3:
                cell.setUpCellWith(title: "Summary:", text: person.summary)
            case 4:
                
                let languages = person.languages.map{$0.language}.joined(separator: ", ")
                cell.setUpCellWith(title: "Languages:", text: languages)
            case 5:
                cell.setUpCellWith(title: "Phone:", text: person.contactInfo.phoneNumber)
            case 6:
                cell.setUpCellWith(title: "Email:", text: person.contactInfo.email)
            default: break
            }
            return cell
        case .project:
            let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath) as! NadiaProjectTableViewCell
            
            guard let project = person.projects?[indexPath.section] else { return UITableViewCell()}
            cell.setUpCell(for: project)
            return cell
        case .work:
            let cell = tableView.dequeueReusableCell(withIdentifier: "workCell", for: indexPath) as! NadiaWorkExperienceCell
            guard let work = person.workPlaces?[indexPath.section] else { return UITableViewCell()}
            cell.setUpCell(for: work)
            return cell
        case .certificate:
            let cell = tableView.dequeueReusableCell(withIdentifier: "certificateCell", for: indexPath) as! NadiaCertificateTableViewCell
            guard let certificate = person.certificates?[indexPath.section] else { return UITableViewCell()}
            cell.setUpCell(for: certificate)
            return cell
        case .education:
            let cell = tableView.dequeueReusableCell(withIdentifier: "educationCell", for: indexPath) as! NadiaEducationTableViewCell
            guard let education = person.education?[indexPath.section] else { return UITableViewCell()}
            cell.setUpCell(for: education)
            return cell
        case .additionalInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultResumeCell", for: indexPath) as! NadiaDefaultTableViewCell
            let text = person.additionalInfo[indexPath.row].title
            let secondaryText = person.additionalInfo[indexPath.row].description
            cell.setUpCellWith(title: text, text: secondaryText)
            return cell
        case .skills:
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultResumeCell", for: indexPath) as! NadiaDefaultTableViewCell
            cell.setUpCellWith(title: person.skills[indexPath.row], text: nil)
            return cell
        case .none: return UITableViewCell()
        }
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch typeInfo {
        case .project: return person.projects?[section].title ?? ""
        case .work: return person.workPlaces?[section].company ?? ""
        case .certificate: return person.certificates?[section].title ?? ""
        case .education: return person.education?[section].name ?? ""
        case .none, .personalInfo, .additionalInfo, .skills: return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        var contentConfig = header.defaultContentConfiguration()
        contentConfig.textProperties.font = UIFont(name: "MuktaMahee Bold", size: 18)
            ?? UIFont.systemFont(ofSize: 18)
        switch typeInfo {
        case .work: contentConfig.text = person.workPlaces?[section].company ?? ""
        case .education: contentConfig.text = person.education?[section].name ?? ""
        case .certificate: contentConfig.text = person.certificates?[section].title ?? ""
        case .project: contentConfig.text = person.projects?[section].title ?? ""
        default: contentConfig.text = "More"
        }
        contentConfig.textProperties.color = UIColor.white
        contentConfig.textProperties.adjustsFontSizeToFitWidth = true
        header.contentConfiguration = contentConfig
        
        var backgroundConfig = UIBackgroundConfiguration.listPlainHeaderFooter()
        backgroundConfig.backgroundColor = .darkGray
        header.backgroundConfiguration = backgroundConfig
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let projectVC = segue.destination as? NadiaProjectDetailedViewController else { return }
        guard let index = tableView.indexPathForSelectedRow?.section,
              let project = person.projects?[index] else { return }
        projectVC.project = project
    }
    
    // MARK: - Private Methods
    private func setUpTitle() {
        switch typeInfo {
        case .personalInfo: title = "📖 Personal Info"
        case .project: title = "🎯 Projects"
        case .work: title =  "🏢 Work Experience"
        case .skills: title = "🛠 Skills"
        case .certificate: title =  "🎖 Certificates"
        case .education: title =  "🧑🏻‍🎓 Education"
        case .additionalInfo: title = "Other Information"
        case .none: break
        }
    }
    
}

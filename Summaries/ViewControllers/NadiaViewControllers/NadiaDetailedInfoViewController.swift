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
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = 0
        switch typeInfo {
        case .project: numberOfRows = person.projects?.count ?? 0
        case .work: numberOfRows = person.workPlaces?.count ?? 0
        case .certificate: numberOfRows = person.certificates?.count ?? 0
        case .education: numberOfRows = person.education?.count ?? 0
        case .none: break
        }
        return numberOfRows
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch typeInfo {
        case .project:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath) as! NadiaProjectTableViewCell
            guard let project = person.projects?[indexPath.row] else { return UITableViewCell()}
            cell.setUpCell(for: project)
            return cell
        case .work:
            let cell = tableView.dequeueReusableCell(withIdentifier: "workCell", for: indexPath) as! NadiaWorkExperienceCell
            guard let work = person.workPlaces?[indexPath.row] else { return UITableViewCell()}
            cell.setUpCell(for: work)
            return cell
        case .certificate:
            let cell = tableView.dequeueReusableCell(withIdentifier: "certificateCell", for: indexPath) as! NadiaCertificateTableViewCell
            guard let certificate = person.certificates?[indexPath.row] else { return UITableViewCell()}
            cell.setUpCell(for: certificate)
            return cell
        case .education:
            let cell = tableView.dequeueReusableCell(withIdentifier: "educationCell", for: indexPath) as! NadiaEducationTableViewCell
            guard let education = person.education?[indexPath.row] else { return UITableViewCell()}
            cell.setUpCell(for: education)
            return cell
        case .none: return UITableViewCell()
        }
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch typeInfo {
        case .project, .work, .education: return 150
        case .certificate: return 100
        case .none: return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch typeInfo {
        case .project: return "🎯 Projects"
        case .work: return "🏢 Work Experience"
        case .certificate: return "🎖 Certificates"
        case .education: return "🧑🏻‍🎓 Education"
        case .none: return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        var contentConfig = header.defaultContentConfiguration()
        contentConfig.textProperties.font = UIFont(name: "MuktaMahee Bold", size: 22)
            ?? UIFont.systemFont(ofSize: 22)
        switch typeInfo {
        case .work: contentConfig.text = "🏢 Work Experience"
        case .education: contentConfig.text = "🧑🏻‍🎓 Education"
        case .certificate: contentConfig.text = "🎖 Certificates"
        case .project: contentConfig.text = "🎯 Projects"
        default: contentConfig.text = "More"
        }
        contentConfig.textProperties.color = UIColor.white
        header.contentConfiguration = contentConfig
        
        var backgroundConfig = UIBackgroundConfiguration.listPlainHeaderFooter()
        backgroundConfig.backgroundColor = .darkGray
        header.backgroundConfiguration = backgroundConfig
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let projectVC = segue.destination as? NadiaProjectDetailedViewController else { return }
        guard let index = tableView.indexPathForSelectedRow?.row,
              let project = person.projects?[index] else { return }
        projectVC.project = project
    }
    
}

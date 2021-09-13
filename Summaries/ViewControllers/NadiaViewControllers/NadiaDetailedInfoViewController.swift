//
//  DetailedInfoViewController.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 12/09/2021.
//

import UIKit

class NadiaDetailedInfoViewController: UITableViewController {
    
    var typeInfo: DetailedInfoN!
    var person: PersonN!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch typeInfo {
        case .project: return 200
        case .work: return 160
        case .certificate: return 100
        case .education: return 150
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let projectVC = segue.destination as? NadiaProjectDetailedViewController else { return }
        guard let index = tableView.indexPathForSelectedRow?.row,
              let project = person.projects?[index] else { return }
        projectVC.project = project
    }
    
}

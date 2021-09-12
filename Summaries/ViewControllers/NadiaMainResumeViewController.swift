//
//  NadiaMainResumeViewController.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 11/09/2021.
//

import UIKit

class NadiaMainResumeViewController: UITableViewController {
    
    var person: PersonN!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = person.fullname
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowsInSection = 0
        switch section {
        case 0: rowsInSection = 7
        case 1: rowsInSection = person.workPlaces?.count ?? 0
        case 2: rowsInSection = 1
        case 3: rowsInSection = person.education?.count ?? 0
        case 4: rowsInSection = person.certificates?.count ?? 0
        case 5: rowsInSection = person.projects?.count ?? 0
        case 6: rowsInSection = person.additionalInfo.count
        default: break
        }
        return rowsInSection
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
            content.text = "\(work.company), \(work.dateOfStart) - \(work.dateOfFinishing) "
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
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

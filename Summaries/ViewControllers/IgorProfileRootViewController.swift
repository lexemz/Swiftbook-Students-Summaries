//
//  IgorProfileRootViewController.swift
//  Summaries
//
//  Created by Igor on 09.09.2021.
//

import UIKit

class IgorProfileRootViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var tableView: UITableView!
    
    // MARK: - Private properties

    private let userData = PersonI.getIgorPersonModel()
    
    // MARK: - Life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.topViewController?.title = userData.fullName
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.topViewController?.title = nil
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

// MARK: - TableView protocols methods

extension IgorProfileRootViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return nil
        case 1: return "Контакты"
        case 2: return "Хобби"
        case 3: return "Навыки"
        default: return "Проекты"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return userData.contacts.count
        case 2: return userData.hobbies.count
        case 3: return userData.skills.count
        default: return userData.projects.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IgorInfoCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.section {
        case 0:
            cell.selectionStyle = .none
            cell.accessoryType = .none
            if indexPath.row == 0 {
                content.text = "Age: \(userData.age)"
            } else {
                content.text = "City: \(userData.city)"
            }
        case 1:
            cell.accessoryType = .disclosureIndicator
            let contact = userData.contacts[indexPath.row]
            content.text = "\(contact.contactType): \(contact.id)"
        case 2:
            cell.selectionStyle = .none
            content.text = userData.hobbies[indexPath.row].name
        case 3:
            cell.selectionStyle = .none
            let skill = userData.skills[indexPath.row]
            content.text = skill.title
            content.secondaryText = "Level: \(skill.skillLevel.rawValue)"
        default:
            cell.accessoryType = .disclosureIndicator
            let project = userData.projects[indexPath.row]
            content.text = project.title
            content.secondaryText = project.descrition
        }
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let contacts = userData.contacts
            guard let url = URL(string: "https://" + contacts[indexPath.row].link) else { return }
            UIApplication.shared.open(url)
        } else if indexPath.section == 4 {
            let projects = userData.projects
            guard let url = URL(string: projects[indexPath.row].link) else { return }
            UIApplication.shared.open(url)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

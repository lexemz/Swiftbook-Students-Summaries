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
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.topViewController?.title = userData.fullName
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.topViewController?.title = nil
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

// MARK: - TableView protocols methods

extension IgorProfileRootViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return nil
        case 1: return "Хобби"
        case 2: return "Навыки"
        default: return "Проекты"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return userData.hobbies.count
        case 2: return userData.skills.count
        default: return userData.projects.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IgorInfoCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                content.text = "Age: \(userData.age)"
            } else if indexPath.row == 1 {
                content.text = "Telegram: \(userData.contacts)"
            } else if indexPath.row == 2 {
                content.text = "City - \(userData.city)"
            }
        case 1:
            content.text = userData.hobbies[indexPath.row].name
        case 2:
            let skill = userData.skills[indexPath.row]
            content.text = skill.title
            content.secondaryText = "Level: \(skill.skillLevel.rawValue)"
        default:
            let project = userData.projects[indexPath.row]
            content.text = project.title
            content.secondaryText = project.descrition
        }
        
        cell.contentConfiguration = content
        return cell
    }
}

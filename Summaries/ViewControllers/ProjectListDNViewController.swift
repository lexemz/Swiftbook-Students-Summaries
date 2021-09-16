//
//  ProjectListDNViewController.swift
//  Summaries
//
//  Created by Дмитрий Данилин on 16.09.2021.
//

import UIKit

class ProjectListDNViewController: UITableViewController {
    
    // MARK: - Transfer data properties
    var projects: [Project] = []

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Default setup
        setupTableView()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        projects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectDN", for: indexPath)

        var content = cell.defaultContentConfiguration()
        let project = projects[indexPath.row]
        
        content.text = project.projectName
        content.secondaryText = project.projectDescription
        
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)

        guard let link = projects[indexPath.row].linkGitHub else { return }
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - Default setup methods
extension ProjectListDNViewController {
    private func setupTableView() {
        title = "Проeкты"
        tableView.tableFooterView = UIView()
    }
}

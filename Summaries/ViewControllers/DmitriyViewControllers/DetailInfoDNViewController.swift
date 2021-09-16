//
//  DetailInfoDNViewController.swift
//  Summaries
//
//  Created by Дмитрий Данилин on 14.09.2021.
//

import UIKit

class DetailInfoDNViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var englishLvlLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var hobbiesLabel: UILabel!
    
    @IBOutlet weak var projectsButton: UIButton!
    
    // MARK: - Transfer data properties
    var person: PersonDN!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Default setup
        setupTitleVC()
        setupLabels()
        setupProjectsButton()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let projectVC = segue.destination as? ProjectListDNViewController else { return }
        projectVC.projects = person.profession.projects
    }
}

// MARK: - Default setup methods
extension DetailInfoDNViewController {
    private func setupTitleVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = person.fullName
    }
    
    private func setupLabels() {
        ageLabel.text = String(person.age)
        englishLvlLabel.text = person.englishLevel.rawValue
        contactLabel.text = person.contact
        hobbiesLabel.text = person.hobbies.joined(separator: ", ")
    }
    
    private func setupProjectsButton() {
        projectsButton.layer.cornerRadius = 10
    }
}

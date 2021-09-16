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
    var person: Person!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Default setup
        setupTitleVC()
        setupLabels()
        setupProjectsButton()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

// MARK: - Default setup methods
extension DetailInfoDNViewController {
    private func setupTitleVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = person.fullName
    }
    
    private func setupLabels() {
        ageLabel.text = String(person.age)
        englishLvlLabel.text = person.profession.englishLevel.rawValue
        contactLabel.text = person.contact
        hobbiesLabel.text = person.hobbies.joined(separator: ", ")
    }
    
    private func setupProjectsButton() {
        projectsButton.isHidden = true // TODO: убрать строчку при добавлении таблицы с просмотром проектов
        projectsButton.layer.cornerRadius = 10
    }
}

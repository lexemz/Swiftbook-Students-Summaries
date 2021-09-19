//
//  ThirdViewController.swift
//  Summaries
//
//  Created by Arcani on 18.09.2021.
//

import UIKit

class AlexThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet var petsTableView: UITableView!
    @IBOutlet var petsImage: UIImageView!
    
    // MARK: - Public Properties
    var user: User!
    var animalDistribution: Float!
    var allPets: [[Pet]]!
    
    override func viewDidLoad() {
        petsTableView.rowHeight = 100
        customizeNavigationBar()
    }
    
    // MARK: - Private Methods
    func customizeNavigationBar() {
        let navBar = self.navigationItem
        navBar.title = "Pets of \(user.name)"
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        allPets.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allPets[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Pet", for: indexPath)
        let name = allPets[indexPath.section][indexPath.row].name
        let petsIndex = allPets[indexPath.section][indexPath.row].petsIndex
        var content = cell.defaultContentConfiguration()
        
        content.text = name
        content.image = UIImage(named: petsIndex)
        
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
         
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if allPets[section] is [Dog] {
            return "Dog"
        }
        else {
            return "Cat"
        }
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = UIColor.purple
        label.textColor = .black
        return label
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = UIImage(named: allPets[indexPath.section][indexPath.row].petsIndex)
        petsImage.image = image
    }    
}

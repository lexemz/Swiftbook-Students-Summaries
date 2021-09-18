//
//  ThirdViewController.swift
//  Summaries
//
//  Created by Arcani on 18.09.2021.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet var petsTableView: UITableView!
    
    
    // MARK: - Private Properties
    private var cats: [Cat]!
    private var dogs: [Dog]!
    private var allPets: [[Pet]]!
    
    
    // MARK: - UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        if cats.isEmpty || dogs.isEmpty {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "123"
        label.backgroundColor = UIColor.purple
        return label
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if pets[section] is Dog {
            return "Dog"
        }
        else {
            return "Cat"
        }
    }
    
    
    
    
    
    
    // MARK: - Public Properties
    var animalDistribution: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    private func getCats() -> [Cat] {
        var cats: [Cat] = []
        guard let animalDistribution = animalDistribution else { return [] }
        switch animalDistribution  {
        case 0.4 ... 0.6:
            for _ in 0 ..< DistributionOfPetTypes.evenDistribution.rawValue {
                cats.append(Cat.getCat())
            }
        case 0 ..< 0.4:
            for _ in 0 ..< DistributionOfPetTypes.onePetType.rawValue {
                cats.append(Cat.getCat())
            }
        default:
            return []
        }
        return cats
    }
    
    private func getDogs() -> [Dog] {
        var dogs: [Dog] = []
        guard let animalDistribution = animalDistribution else { return [] }
        switch animalDistribution  {
        case 0.4 ... 0.6:
            for _ in 0 ..< DistributionOfPetTypes.evenDistribution.rawValue {
                dogs.append(Dog.getDog())
            }
        case 0.6 ... 1:
            for _ in 0 ..< DistributionOfPetTypes.onePetType.rawValue {
                dogs.append(Dog.getDog())
            }
        default:
            return []
        }
        return dogs
    }
    
    private func fillAllPetsArray() {
        if !dogs.isEmpty {
            allPets.append(dogs)
        }
        
        if !cats.isEmpty {
            allPets.append(cats)
        }
    }
}

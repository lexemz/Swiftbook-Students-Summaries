//
//  ThirdViewController.swift
//  Summaries
//
//  Created by Arcani on 18.09.2021.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
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
    
    private func getPets() -> [Pet] {
        var pets: [Pet] = []
        guard let animalDistribution = animalDistribution else { return [] }
        switch animalDistribution  {
        case 0.4 ... 0.6:
            for _ in 0 ... DistributionOfPetTypes.evenDistribution.rawValue {
                pets.append(Cat.getCat())
            }
            for _ in 0 ... DistributionOfPetTypes.evenDistribution.rawValue {
                pets.append(Dog.getDog())
            }
        case 0 ..< 0.4:
            for _ in 0 ... DistributionOfPetTypes.onePetType.rawValue {
                pets.append(Cat.getCat())
            }
        default:
            for _ in 0 ... DistributionOfPetTypes.onePetType.rawValue {
                pets.append(Dog.getDog())
            }
        }
        return pets
    }
}

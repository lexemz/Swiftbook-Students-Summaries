//
//  SecondViewController.swift
//  Summaries
//
//  Created by Arcani on 17.09.2021.
//

import UIKit

class AlexSecondViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var firstStack: UIStackView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var firstStackLabel: UILabel!
    @IBOutlet var firstStackEmoji: UILabel!
    @IBOutlet var okButton: UIButton!
    
    // MARK: - Public Properties
    var user: User!
    
    // MARK: - Private properties
    private var catsOrDogs: Float!
    private var allAnimals: [[Pet]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstStackLabel.text = ""
        slider.value = 0.5
        styleTheButton(button: okButton)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let thirdVC = segue.destination as? AlexThirdViewController else { return }
        thirdVC.allPets = allAnimals
        thirdVC.user = user
    }
         
    // MARK: - IB Actions
    @IBAction func nextQuestionButtonPressed() {
        catsOrDogs = slider.value
        let cats = getCats(animalDistribution: slider.value)
        let dogs = getDogs(animalDistribution: slider.value)
        allAnimals = getAllPets(cats: cats, dogs: dogs)
    }
    
    @IBAction func moveTheSlider() {
        switch slider.value  {
        case 0.4 ... 0.6:
            firstStackLabel.text = "I like my puppies as much as my cats"
            firstStackEmoji.text = "😼🐶"
        case 0 ..< 0.4:
            firstStackLabel.text = "Definitely kittens!"
            firstStackEmoji.text = "🐱"
        default:
            firstStackLabel.text = "Doggos are the best!"
            firstStackEmoji.text = "🐶"
        }
    }
    
    private func getCats(animalDistribution: Float) -> [Cat] {
        var chosenCats: [Cat] = []
        switch animalDistribution  {
        case 0.4 ... 0.6:
            for _ in 0 ..< DistributionOfPetTypes.evenDistribution.rawValue {
                chosenCats.append(Cat.getCat())
            }
        case 0 ..< 0.4:
            for _ in 0 ..< DistributionOfPetTypes.onePetType.rawValue {
                chosenCats.append(Cat.getCat())
            }
        default:
            return chosenCats
        }
        return chosenCats
    }
    
    private func getDogs(animalDistribution: Float) -> [Dog] {
        var chosenDogs: [Dog] = []
        switch animalDistribution  {
        case 0.4 ... 0.6:
            for _ in 0 ..< DistributionOfPetTypes.evenDistribution.rawValue {
                chosenDogs.append(Dog.getDog())
            }
        case 0.6 ... 1:
            for _ in 0 ..< DistributionOfPetTypes.onePetType.rawValue {
                chosenDogs.append(Dog.getDog())
            }
        default:
            return chosenDogs
        }
        return chosenDogs
    }
    
    private func getAllPets(cats: [Cat], dogs: [Dog]) -> [[Pet]] {

        var allPets: [[Pet]] = []
        
        if !cats.isEmpty {
            allPets.append(cats)
        }
        if !dogs.isEmpty {
            allPets.append(dogs)
        }
        return allPets
    }
}

// MARK: - Extension for button configuration
extension AlexSecondViewController {
    
    private func styleTheButton(button: UIButton) {
        
        let textColor = UIColor(
            cgColor: CGColor(
                red: 255,
                green: 255,
                blue: 255,
                alpha: 1))
        
        let shadowColor = UIColor(
            cgColor: CGColor(
                red: 0,
                green: 0,
                blue: 0,
                alpha: 0.5))
        
        let contentInsets = UIEdgeInsets(
            top: 0,
            left: 10,
            bottom: 0,
            right: 10)
        
        button.layer.borderWidth = 0.7
        button.layer.cornerRadius = 5
        button.layer.backgroundColor = CGColor(
            red: 128,
            green: 0,
            blue: 128,
            alpha: 0.7)
        button.setTitleColor(textColor, for: .normal)
        button.setTitleShadowColor(shadowColor, for: .normal)
        button.contentEdgeInsets = contentInsets
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}

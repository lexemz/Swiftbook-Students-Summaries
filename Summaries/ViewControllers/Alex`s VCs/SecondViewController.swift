//
//  SecondViewController.swift
//  Summaries
//
//  Created by Arcani on 17.09.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var firstStack: UIStackView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var firstStackLabel: UILabel!
    @IBOutlet var firstStackEmoji: UILabel!
    
    // MARK: - Private properties
    private var catsOrDogs: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstStackLabel.text = ""
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let thirdVC = segue.destination as? ThirdViewController else { return }
        thirdVC.animalDistribution = catsOrDogs
    }
         
    // MARK: - IB Actions
    @IBAction func nextQuestionButtonPressed() {
        catsOrDogs = slider.value
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
}

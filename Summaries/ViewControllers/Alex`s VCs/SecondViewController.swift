//
//  SecondViewController.swift
//  Summaries
//
//  Created by Arcani on 17.09.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var progressBar: UIProgressView!
    
    @IBOutlet var firstStack: UIStackView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var firstStackLabel: UILabel!
    @IBOutlet var firstStackEmoji: UILabel!
    
    @IBOutlet var secondStack: UIStackView!
    @IBOutlet var secondStackTextField: UITextField!
    @IBOutlet var secondStackStepper: UIStepper!
    
    // MARK: - Private properties
    
    private var catsOrDogs: Float = 0
    private var numberOfPets = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstStackLabel.text = ""
        progressBar.progress = 0
        secondStack.isHidden = true
    }
    
     // MARK: - Navigation
     

    
    // MARK: - IB Actions
    
    @IBAction func nextQuestionButtonPressed() {
        catsOrDogs = slider.value
        firstStack.isHidden = true
        progressBar.setProgress(0.5, animated: true)
        secondStack.isHidden.toggle()
    }
    
    @IBAction func stepperPressed() {
        let stepperValue = Int(secondStackStepper.value)
        secondStackTextField.text = String(stepperValue)
    }
    
    
    @IBAction func readyButtonPushed() {
        progressBar.setProgress(1, animated: true)
        numberOfPets = Int(secondStackStepper.value)
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
    
    
    // MARK: - Private Methods
    
    
    
}

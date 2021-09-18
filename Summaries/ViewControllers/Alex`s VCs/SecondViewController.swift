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
    
    
    
    
    // MARK: - Private properties
    
    private var sliderValue: Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        firstStackLabel.text = ""
        progressBar.progress = 0
        secondStack.isHidden = true
        
        

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

    // MARK: - IB Actions
    
    @IBAction func nextQuestionButtonPressed() {
        sliderValue = slider.value
        firstStack.isHidden = true
        progressBar.setProgress(0.5, animated: true)
    }
    
    @IBAction func stepperPressed() {
    }
    
    
    @IBAction func readyButtonPushed() {
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

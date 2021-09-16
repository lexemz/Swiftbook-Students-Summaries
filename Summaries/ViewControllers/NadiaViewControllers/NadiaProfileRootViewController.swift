//
//  NadiaProfileRootViewController.swift
//  Summaries
//
//  Created by Igor on 10.09.2021.
//

import UIKit

class NadiaProfileRootViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var onePageButton: UIButton!
    @IBOutlet weak var detailedFormButton: UIButton!
    
    // MARK: - Private Properties
    private let person = PersonN.nadia
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImage()
        setUpLabels()
        setUpButtons()
        setUpView()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "shortFormSegue":
            if let resumeVC = segue.destination as? NadiaShortFormResumeViewController {
                resumeVC.person = person
            }
        case "detailedFormSegue":
            if let detailedVC = segue.destination as? NadiaMainResumeViewController {
                detailedVC.person = person
            }
        default: return
        }
        
    }
    
    // MARK: - IBAction
    @IBAction func detailedButtonPressed() {
        performSegue(withIdentifier: "detailedFormSegue", sender: nil)
    }
    
    @IBAction func onePageButtonPressed() {
        performSegue(withIdentifier: "shortFormSegue", sender: nil)
    }
    
    
    // MARK: - Private methods
    private func setUpLabels() {
        titleLabel.text = person.expectedPosition
        descriptionLabel.text = person.summary
    }
    
    private func setUpButtons() {
        onePageButton.layer.cornerRadius = 5
        detailedFormButton.layer.cornerRadius = 5
    }
    
    private func setUpImage() {
        photoImageView.layer.cornerRadius = 15
        photoImageView.image = UIImage(named: person.photoLink ?? "nadiaPreviewPlaceholder")
        photoImageView.layer.borderWidth = 5
        photoImageView.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    private func setUpView() {
        view.addVerticalGradientLayer(
            topColor: .darkGray,
            middleColor: .white,
            bottomColor: .lightGray
        )
    }  
}


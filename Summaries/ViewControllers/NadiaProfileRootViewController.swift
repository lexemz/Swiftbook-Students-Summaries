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
    @IBOutlet weak var moreInfoButton: UIButton!
    
    // MARK: - Private Properties
    let person = PersonN.nadia
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImage()
        setUpLabels()
        setUpButton()
        setUpView()
    }
    
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resumeVC = segue.destination as? NadiaMainResumeViewController else { return }
        resumeVC.person = person
     }
    
    // MARK: - Private methods
    private func setUpLabels() {
        titleLabel.text = person.expectedPosition
        descriptionLabel.text = person.summary
    }
    
    private func setUpButton() {
        moreInfoButton.layer.cornerRadius = 5
    }
    
    private func setUpImage() {
        photoImageView.layer.cornerRadius = 15
        photoImageView.image = UIImage(named: person.photoLink ?? "person.fill")
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

extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, middleColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, middleColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}

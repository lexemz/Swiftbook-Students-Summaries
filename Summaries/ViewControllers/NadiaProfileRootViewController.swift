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
     // TODO: - create next static table vc
     }
    
    // MARK: - Private methods
    private func setUpLabels() {
        titleLabel.text = "Junior iOS Developer"
        descriptionLabel.text = "Good communication skills, ability to handle stress, a great desire to learn new technologies and improve the existing knowledge."
    }
    
    private func setUpButton() {
        moreInfoButton.layer.cornerRadius = 5
    }
    
    private func setUpImage() {
        photoImageView.layer.cornerRadius = 15
        photoImageView.image = UIImage(named: "NadiaPhoto")
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

//
//  DmitryProfileRootViewController.swift
//  Summaries
//
//  Created by Igor on 09.09.2021.
//

import UIKit

class DmitryProfileRootViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet weak var moreInfoButton: UIButton!
    
    // MARK: - Private properties
    private let person = Person.getPerson()
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Defaults setup
        setupPhotoImageView()
        setupLabels()
        setupMoreInfoButton()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Default setup methods
extension DmitryProfileRootViewController {
    private func setupPhotoImageView() {
        photoImageView.image = UIImage(named: person.photo.rawValue)
        photoImageView.layer.cornerRadius = photoImageView.frame.height / 2
        photoImageView.clipsToBounds = true
    }
    
    private func setupLabels() {
        fullNameLabel.text = person.fullName
        professionLabel.text = person.profession.professionName
        skillsLabel.text = person.profession.skills.joined(separator: ", ")
    }
    
    private func setupMoreInfoButton() {
        moreInfoButton.layer.cornerRadius = 10
    }
}

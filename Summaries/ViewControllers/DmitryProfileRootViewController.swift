//
//  DmitryProfileRootViewController.swift
//  Summaries
//
//  Created by Igor on 09.09.2021.
//

import UIKit

class DmitryProfileRootViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moreInfoButton: UIButton!
    

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

// MARK: - Private method
extension DmitryProfileRootViewController {
    private func setupPhotoImageView() {
        photoImageView.image = UIImage(named: "dmitriyPhoto")
        photoImageView.layer.cornerRadius = photoImageView.frame.height / 2
        photoImageView.clipsToBounds = true
    }
    
    // TODO: Стоит добавить модель данных и брать данные из модели
    private func setupLabels() {
        fullNameLabel.text = "Дмитрий Данилин"
        // TODO: Сделать под профессию отдельный лейбл а описание переименовать в ключевые навыки.
        descriptionLabel.text = "Trainee iOS Develop. Xcode, Swift, UIKit, CoreData, Realm, MVC, GIT, Работа в команде. Уровень английского - А2."
    }
    
    private func setupMoreInfoButton() {
        moreInfoButton.layer.cornerRadius = 10
    }
}

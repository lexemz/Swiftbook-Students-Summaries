//
//  IgorProfileRootViewController.swift
//  Summaries
//
//  Created by Igor on 09.09.2021.
//

import UIKit

class IgorProfileRootViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var tableView: UITableView!

    // MARK: - Private properties

    private let userData = PersonI.getIgorPersonModel()
    private let imageView = UIImageView(image: UIImage(named: "igor"))

    // MARK: - Life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.topViewController?.title = userData.fullName
        navigationController?.navigationBar.prefersLargeTitles = true
        installProfileImage()
    }

    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.topViewController?.title = nil
        navigationController?.navigationBar.prefersLargeTitles = false
        for parent in navigationController!.navigationBar.subviews {
            parent.removeFromSuperview()
        }
    }
}

// MARK: - TableView protocols methods

extension IgorProfileRootViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return nil
        case 1: return "Контакты"
        case 2: return "Хобби"
        case 3: return "Навыки"
        default: return "Проекты"
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return userData.contacts.count
        case 2: return userData.hobbies.count
        case 3: return userData.skills.count
        default: return userData.projects.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IgorInfoCell", for: indexPath)
        var content = cell.defaultContentConfiguration()

        switch indexPath.section {
        case 0:
            cell.selectionStyle = .none
            cell.accessoryType = .none
            if indexPath.row == 0 {
                content.text = "Age: \(userData.age)"
            } else {
                content.text = "City: \(userData.city)"
            }
        case 1:
            cell.accessoryType = .disclosureIndicator
            let contact = userData.contacts[indexPath.row]
            content.text = "\(contact.contactType): \(contact.id)"
        case 2:
            cell.selectionStyle = .none
            content.text = userData.hobbies[indexPath.row].name
        case 3:
            cell.selectionStyle = .none
            let skill = userData.skills[indexPath.row]
            content.text = skill.title
            content.secondaryText = "Level: \(skill.skillLevel.rawValue)"
        default:
            cell.accessoryType = .disclosureIndicator
            let project = userData.projects[indexPath.row]
            content.text = project.title
            content.secondaryText = project.descrition
        }

        cell.contentConfiguration = content
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let contacts = userData.contacts
            guard let url = URL(string: "https://" + contacts[indexPath.row].link) else { return }
            UIApplication.shared.open(url)
        } else if indexPath.section == 4 {
            let projects = userData.projects
            guard let url = URL(string: projects[indexPath.row].link) else { return }
            UIApplication.shared.open(url)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Profile Image Configuration

extension IgorProfileRootViewController {
    private enum Const {
        /// Image height/width for Large NavBar state
        static let ImageSizeForLargeState: CGFloat = 50
        /// Margin from right anchor of safe area to right anchor of Image
        static let ImageRightMargin: CGFloat = 16
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
        static let ImageBottomMarginForLargeState: CGFloat = 12
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
        static let ImageBottomMarginForSmallState: CGFloat = 6
        /// Image height/width for Small NavBar state
        static let ImageSizeForSmallState: CGFloat = 32
        /// Height of NavBar for Small state. Usually it's just 44
        static let NavBarHeightSmallState: CGFloat = 44
        /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
        static let NavBarHeightLargeState: CGFloat = 96.5
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }

    private func installProfileImage() {
        // Initial setup for image for Large NavBar state since the the screen always has Large NavBar once it gets opened
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -Const.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -Const.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }

    private func moveAndResizeImage(for height: CGFloat) {
        var coeff: CGFloat {
            let delta = height - Const.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Const.NavBarHeightLargeState - Const.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }

        let factor = Const.ImageSizeForSmallState / Const.ImageSizeForLargeState

        var scale: CGFloat {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }

        // Value of difference between icons for large and small states
        let sizeDiff = Const.ImageSizeForLargeState * (1.0 - factor) // 8.0
        var yTranslation: CGFloat {
            /// This value = 14. It equals to difference of 12 and 6 (bottom margin for large and small states). Also it adds 8.0 (size difference when the image gets smaller size)
            let maxYTranslation = Const.ImageBottomMarginForLargeState - Const.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, maxYTranslation - coeff * (Const.ImageBottomMarginForSmallState + sizeDiff)))
        }

        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)

        imageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
}

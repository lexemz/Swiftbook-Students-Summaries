//
//  NadiaDetailedImageViewController.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 13/09/2021.
//

import UIKit

class NadiaDetailedImageViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var image: UIImageView!
    
    // MARK: - Public properties
    var imageFullSize: String!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: imageFullSize ?? "nadiaPreviewPlaceholder")
    }
    
    // MARK: - IBAction
    @IBAction func closeButtonPressed() {
        dismiss(animated: true)
    }
}

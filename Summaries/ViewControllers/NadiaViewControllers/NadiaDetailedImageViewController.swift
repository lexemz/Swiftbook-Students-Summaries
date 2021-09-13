//
//  NadiaDetailedImageViewController.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 13/09/2021.
//

import UIKit

class NadiaDetailedImageViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var imageFullSize: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: imageFullSize ?? "nadiaPreviewPlaceholder")

    }
    
    @IBAction func closeButtonPressed() {
        dismiss(animated: true)
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

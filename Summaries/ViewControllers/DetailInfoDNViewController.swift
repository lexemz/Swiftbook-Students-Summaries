//
//  DetailInfoDNViewController.swift
//  Summaries
//
//  Created by Дмитрий Данилин on 14.09.2021.
//

import UIKit

class DetailInfoDNViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var englishLvlLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var hobbiesLabel: UILabel!
    
    // MARK: - Transfer data properties
    var person: Person!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

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

}

// MARK: - Default setup methods

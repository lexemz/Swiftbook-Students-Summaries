//
//  FirstViewController.swift
//  Summaries
//
//  Created by Arcani on 16.09.2021.
//

import UIKit

protocol ThirdViewControllerDelegate {
    func initializeDelegate(dataType: UIViewController)
}

class FirstViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var letsGoButton: UIButton!
    
    // MARK: - Private Properties
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleTheButton(button: letsGoButton)

        showAlert(
            title: "Hello, buddy!",
            message: "Type in your name and let`s get started!"
        )
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else { return }
        secondVC.user = user
    }
    
    // MARK: - IB Actions
    @IBAction func buttonPressed() {
        if textField.text == nil || textField.text == "" {
            showAlert(
                title: "Oops!",
                message: "Still need your name! :)")
        }
        
        guard let name = textField.text else { return }
        user = User.getUser(name: name)
    }
    
    // MARK: - Private methods
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension FirstViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension FirstViewController: ThirdViewControllerDelegate {
    func initializeDelegate(dataType: UIViewController) {
    }
}

// MARK: - Extension for button configuration
extension FirstViewController {
    
    private func styleTheButton(button: UIButton) {
        
        let textColor = UIColor(
            cgColor: CGColor(
                red: 255,
                green: 255,
                blue: 255,
                alpha: 1))
        
        let shadowColor = UIColor(
            cgColor: CGColor(
                red: 0,
                green: 0,
                blue: 0,
                alpha: 0.5))
        
        let contentInsets = UIEdgeInsets(
            top: 0,
            left: 10,
            bottom: 0,
            right: 10)
        
        button.layer.borderWidth = 0.7
        button.layer.cornerRadius = 5
        button.layer.backgroundColor = CGColor(
            red: 128,
            green: 0,
            blue: 128,
            alpha: 0.7)
        button.setTitleColor(textColor, for: .normal)
        button.setTitleShadowColor(shadowColor, for: .normal)
        button.contentEdgeInsets = contentInsets
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}

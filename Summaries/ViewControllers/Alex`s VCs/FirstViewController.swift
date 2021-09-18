//
//  FirstViewController.swift
//  Summaries
//
//  Created by Arcani on 16.09.2021.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var letsGoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        showAlert(
            title: "Hello, buddy!",
            message: "Type in your name and let`s get started!"
        )
        styleTheButton(button: letsGoButton)
        
    }
    
    @IBAction func buttonPressed() {
        if textField.text == nil || textField.text == "" {
            showAlert(
                title: "Oops!",
                message: "Still need your name! :)")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

// MARK: - Private methods

    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
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











// MARK: - UITextFieldDelegate
extension FirstViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

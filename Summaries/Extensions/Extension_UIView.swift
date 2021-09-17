//
//  Extension+UIView.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 16/09/2021.
//

import UIKit
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

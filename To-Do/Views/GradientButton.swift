//
//  GradientButton.swift
//  To-Do
//
//  Created by Владислав Лисянский on 09/02/2019.
//  Copyright © 2019 Владислав Лисянский. All rights reserved.
//

import UIKit

@IBDesignable
class GradientButton: UIButton {
  let gradientLayer = CAGradientLayer()
  
  @IBInspectable
  var topGradientColor: UIColor? {
    didSet {
      setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
    }
  }
  
  @IBInspectable
  var bottomGradientColor: UIColor? {
    didSet {
      setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
    }
  }
  
  private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
    if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
      gradientLayer.frame = bounds
      gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
      gradientLayer.borderColor = layer.borderColor
      gradientLayer.borderWidth = layer.borderWidth
      gradientLayer.cornerRadius = cornerRadius
      layer.insertSublayer(gradientLayer, at: 0)
    } else {
      gradientLayer.removeFromSuperlayer()
    }
  }
}

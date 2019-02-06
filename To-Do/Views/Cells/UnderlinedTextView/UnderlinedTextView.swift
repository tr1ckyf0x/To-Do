//
//  UnderlinedTextField.swift
//  To-Do
//
//  Created by Владислав Лисянский on 11/02/2019.
//  Copyright © 2019 Владислав Лисянский. All rights reserved.
//

import UIKit

@IBDesignable
class UnderlinedTextView: UITextView {
  
  let underlineLayer = CAShapeLayer()
  
  @IBInspectable
  var underlineWidth: CGFloat = 1 {
    didSet {
      underlineLayer.lineWidth = underlineWidth
      setUnderlinePath()
    }
  }
  
  override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
    customInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    customInit()
  }
  
  private func customInit() {
    underlineLayer.lineWidth = underlineWidth
    underlineLayer.lineCap = .round
    underlineLayer.lineJoin = .round
    underlineLayer.strokeColor = R.color.underlineColor()?.cgColor
    layer.addSublayer(underlineLayer)
  }
  
  private func setUnderlinePath() {
    let halfUnderlineWidth = underlineWidth / 2
    let underlineY = bounds.height - halfUnderlineWidth
    let path = UIBezierPath()
    path.move(to: CGPoint(x: halfUnderlineWidth, y: underlineY))
    path.addLine(to: CGPoint(x: bounds.width - halfUnderlineWidth, y: underlineY))
    underlineLayer.path = path.cgPath
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setUnderlinePath()
  }
  
}

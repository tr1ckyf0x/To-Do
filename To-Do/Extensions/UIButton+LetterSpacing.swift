//
//  UIButton+LetterSpacing.swift
//  To-Do
//
//  Created by Владислав Лисянский on 08/02/2019.
//  Copyright © 2019 Владислав Лисянский. All rights reserved.
//

import UIKit

extension UIButton {
  
  @IBInspectable
  var letterSpace: CGFloat {
    set {
      let attributedString: NSMutableAttributedString!
      if let currentAttrString = attributedTitle(for: .normal) {
        attributedString = NSMutableAttributedString(attributedString: currentAttrString)
      }
      else {
        attributedString = NSMutableAttributedString(string: self.titleLabel?.text ?? "")
        setTitle(.none, for: .normal)
      }
      
      attributedString.addAttribute(.kern,
                                    value: newValue,
                                    range: NSRange(location: 0, length: attributedString.length))
      
      setAttributedTitle(attributedString, for: .normal)
    }
    
    get {
      if let currentLetterSpace = attributedTitle(for: .normal)?.attribute(.kern, at: 0, effectiveRange: .none) as? CGFloat {
        return currentLetterSpace
      }
      else {
        return 0
      }
    }
  }
}

//
//  SwipeActionView.swift
//  To-Do
//
//  Created by Владислав Лисянский on 10/02/2019.
//  Copyright © 2019 Владислав Лисянский. All rights reserved.
//

import UIKit

@IBDesignable
class SwipeActionView: UIView {
  
  @IBOutlet var contentView: UIView!
  
  @IBOutlet weak var actionImageView: UIImageView!
  
  @IBInspectable
  var actionImage: UIImage? {
    get { return actionImageView?.image }
    set { actionImageView?.image = newValue }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit() {
    xibSetUp()
  }
  
  private func xibSetUp() {
    contentView = loadViewFromNib()
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    addSubview(contentView)
  }
  
  private func loadViewFromNib() -> UIView {
    return R.nib.swipeActionView.instantiate(withOwner: self, options: nil)[0] as! UIView
  }

}

//
//  PriorityView.swift
//  To-Do
//
//  Created by Владислав Лисянский on 09/02/2019.
//  Copyright © 2019 Владислав Лисянский. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable
class PriorityView: UIView {
  
  private let circleView = UIView()
  
  var priority: TaskPriority = .none {
    didSet {
      circleView.backgroundColor = priority.color
    }
  }
  
  @IBInspectable
  var inspectablePriority: String {
    get { return priority.rawValue }
    set { priority = TaskPriority(rawValue: newValue) ?? .none }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    customInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    customInit()
  }
  
  private func customInit() {
    addSubview(circleView)
    circleView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.height.equalTo(circleView.snp.width)
      make.centerY.equalToSuperview()
//      make.top.bottom.equalToSuperview().priority(ConstraintPriority.high)
    }
    priority = .none
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    circleView.circleCorner = true
  }

}

fileprivate extension TaskPriority {
  var color: UIColor? {
    switch self {
    case .none: return R.color.nonePriorityColor()
    case .low: return R.color.lowPriorityColor()
    case .medium: return R.color.mediumPriorityColor()
    case .high: return R.color.highPriorityColor()
    }
  }
}

//
//  PriorityCollectionCell.swift
//  To-Do
//
//  Created by Владислав Лисянский on 10/02/2019.
//  Copyright © 2019 Владислав Лисянский. All rights reserved.
//

import UIKit

class PriorityCollectionCell: UICollectionViewCell {
  
  var priority: TaskPriority = .none {
    didSet {
      priorityView.priority = priority
      priorityTitleLabel.text = priority.title
    }
  }
  
  @IBOutlet weak var priorityView: PriorityView!
  
  @IBOutlet weak var priorityTitleLabel: UILabel!
  
  @IBOutlet weak var checkmarkImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    priority = .none
  }
  
  override var isSelected: Bool {
    didSet {
      checkmarkImageView?.isHidden = !isSelected
    }
  }
  
  override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
    setNeedsLayout()
    layoutIfNeeded()
    
    let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
    
    var frame = layoutAttributes.frame
    frame.size = size
    layoutAttributes.frame = frame
    
    return layoutAttributes
  }
  
}

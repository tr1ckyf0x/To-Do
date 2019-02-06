//
//  UIView+UIImageConverting.swift
//  To-Do
//
//  Created by Владислав Лисянский on 10/02/2019.
//  Copyright © 2019 Владислав Лисянский. All rights reserved.
//

import UIKit

extension UIView {
  func toImage() -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
    drawHierarchy(in: bounds, afterScreenUpdates: true)
    let snapshotImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return snapshotImage
  }
}

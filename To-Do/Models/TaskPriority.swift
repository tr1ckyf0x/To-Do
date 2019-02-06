//
//  TaskPriority.swift
//  To-Do
//
//  Created by Владислав Лисянский on 09/02/2019.
//  Copyright © 2019 Владислав Лисянский. All rights reserved.
//

import Foundation
import UIKit

enum TaskPriority: String, CaseIterable {
  case none
  case low
  case medium
  case high
  
  var title: String {
    switch self {
    case .none: return "Neutral"
    case .low: return "Normal"
    case .medium: return "Important"
    case .high: return "Urgently"
    }
  }
}

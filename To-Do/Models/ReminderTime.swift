//
//  ReminderTime.swift
//  To-Do
//
//  Created by Владислав Лисянский on 12/02/2019.
//  Copyright © 2019 Владислав Лисянский. All rights reserved.
//

import Foundation

enum ReminderTime: CaseIterable {
  case fiveMinutes
  case thirtyMinutes
  case oneHour
  case oneDay
  
  var title: String {
    switch self {
    case .fiveMinutes: return "5 min"
    case .thirtyMinutes: return "30 min"
    case .oneHour: return "1 h"
    case .oneDay: return "1 d"
    }
  }
}

//
//  TaskCell.swift
//  To-Do
//
//  Created by Владислав Лисянский on 09/02/2019.
//  Copyright © 2019 Владислав Лисянский. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
  
  @IBOutlet weak var priorityView: PriorityView!
  
  @IBOutlet weak var checkboxImageView: UIImageView!
  
  @IBOutlet weak var taskTitleLabel: UILabel!

  @IBOutlet weak var taskSubtitleLabel: UILabel!
  
  @IBOutlet weak var timeLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

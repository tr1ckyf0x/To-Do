//
//  CreateTaskViewController.swift
//  To-Do
//
//  Created by Владислав Лисянский on 10/02/2019.
//  Copyright © 2019 Владислав Лисянский. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
  
  @IBOutlet weak var priorityCollectionView: UICollectionView!
  
  @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
  
  @IBOutlet weak var titleTextView: UnderlinedTextView!
  
  @IBOutlet weak var descriptionTextView: UnderlinedTextView!
  
  @IBOutlet weak var timePicker: UIDatePicker!
  
  @IBOutlet weak var reminderPicker: UIPickerView!
  
  private let priorities = TaskPriority.allCases
  
  override func viewDidLoad() {
    super.viewDidLoad()
    timePicker.setValue(R.color.accentDarkColor(), forKey: "textColor")
    reminderPicker.setValue(R.color.accentDarkColor(), forKey: "textColor")
    titleTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
    descriptionTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
    priorityCollectionView.register(R.nib.priorityCollectionCell)
    flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    priorityCollectionView.dataSource = self
    priorityCollectionView.delegate = self
    
    reminderPicker.dataSource = self
    reminderPicker.delegate = self
  }
  
}

extension CreateTaskViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return priorities.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let priorityCell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.priorityCell, for: indexPath)
    priorityCell?.priority = priorities[indexPath.row]
    
    return priorityCell ?? UICollectionViewCell()
  }
}

extension CreateTaskViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    UIView.animate(withDuration: 0.5, animations: {
      collectionView.collectionViewLayout.invalidateLayout()
    }, completion: { completed in
      collectionView.scrollToItem(at: indexPath, at: .right, animated: false)
    })
  }
}

extension CreateTaskViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return ReminderTime.allCases.count
  }
}

extension CreateTaskViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return ReminderTime.allCases[row].title
  }
}

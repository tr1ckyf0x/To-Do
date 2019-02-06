//
//  ToDoListViewController.swift
//  To-Do
//
//  Created by Владислав Лисянский on 09/02/2019.
//  Copyright © 2019 Владислав Лисянский. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class ToDoListViewController: UIViewController {
  
  @IBOutlet weak var filterButton: UIBarButtonItem!
  
  @IBOutlet weak var menuButton: UIBarButtonItem!
  
  @IBOutlet weak var tableView: UITableView!
  
  @IBOutlet weak var addButton: UIButton!
  
  private let sections: [[Int]] = [[1, 2], [3, 4, 5], [6, 7, 8, 9]]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(resource: R.nib.taskListSectionHeaderView)
    tableView.register(nib, forHeaderFooterViewReuseIdentifier: "SectionHeader")
    
    tableView.dataSource = self
    tableView.delegate = self
    
    addButton.rx.tap.subscribe(onNext: { [weak self] in
      self?.performSegue(withIdentifier: R.segue.toDoListViewController.showCreateTask, sender: self)
    }).disposed(by: rx.disposeBag)
  }
  
}

extension ToDoListViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int { return sections.count }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return sections[section].count }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let taskCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.taskCell, for: indexPath)
    return taskCell ?? UITableViewCell()
  }
}

extension ToDoListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionHeader")
  }
}

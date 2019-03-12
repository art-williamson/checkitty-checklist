//
//  ViewController.swift
//  Checklists
//
//  Created by Art Williamson on 3/11/19.
//  Copyright © 2019 Art Williamson. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: overrides
    override func tableView(_ tableView: UITableView, didSelectRowAt index: IndexPath) {
        //set the checkmark on or off for the cell
        if let cell = tableView.cellForRow(at: index) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }

        tableView.deselectRow(at: index, animated: true)
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem",
                                                     for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel

        if indexPath.row % 5 == 0 {
            label.text = "Something nonsensical"
        } else if indexPath.row % 5 == 1 {
            label.text = "Something whimsical"
        } else if indexPath.row % 5 == 2 {
            label.text = "Something tragic"
        } else if indexPath.row % 5 == 3 {
            label.text = "Something wise"
        } else if indexPath.row % 5 == 4 {
            label.text = "Yo mama"
        }
        return cell
    }
}


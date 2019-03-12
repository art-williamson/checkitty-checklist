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

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem",
                                                     for: indexPath)
            return cell
    }
}


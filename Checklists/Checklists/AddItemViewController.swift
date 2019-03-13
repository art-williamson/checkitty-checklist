//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Art Williamson on 3/13/19.
//  Copyright © 2019 Art Williamson. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
    //MARK: Outlets
    @IBOutlet weak var textField: UITextField!


    //MARK: Actions
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func done() {
        print("value of text field \(textField.text)")
        navigationController?.popViewController(animated: true)
    }

    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            return nil
    }
}

//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by Art Williamson on 3/18/19.
//  Copyright © 2019 Art Williamson. All rights reserved.
//

import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController)

    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist)

    func listDetaiLViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!

    weak var delegate: ListDetailViewControllerDelegate?

    var checkListToEdit: Checklist?

    //MARK: overrides

    override func viewDidLoad() {
        //disable large titels for this view
        navigationItem.largeTitleDisplayMode = .never
        if let checklist = checkListToEdit {
            title = "Edit Checklist"
            textField.text = checklist.name
            doneButton.isEnabled = true
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }

    //MARK: actions

    @IBAction func cancel() {
        delegate?.listDetailViewControllerDidCancel(self)
    }

    @IBAction func done() {
        if let checklist = checkListToEdit {
            checklist.name = textField.text!
            delegate?.listDetaiLViewController(self, didFinishEditing: checklist)
        } else {
            let checklist = Checklist(name: textField.text!)
            delegate?.listDetailViewController(self, didFinishAdding: checklist)
        }
    }

    //MARK: tableview delegates

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

    //MARK: textfield delegeates

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange,
                                                  with: string)
        doneButton.isEnabled = !newText.isEmpty
        return true
    }
}


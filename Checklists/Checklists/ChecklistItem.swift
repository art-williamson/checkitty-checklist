//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Art Williamson on 3/12/19.
//  Copyright © 2019 Art Williamson. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable{
    var text = ""
    var isChecked = false

    func toggleChecked() {
        isChecked = !isChecked
    }
}

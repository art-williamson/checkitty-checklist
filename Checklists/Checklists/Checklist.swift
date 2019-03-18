//
//  Checklist.swift
//  Checklists
//
//  Created by Art Williamson on 3/18/19.
//  Copyright © 2019 Art Williamson. All rights reserved.
//

import UIKit

class Checklist: NSObject {
    var name = ""

    init(name: String) {
        self.name = name
        super.init()
    }
}

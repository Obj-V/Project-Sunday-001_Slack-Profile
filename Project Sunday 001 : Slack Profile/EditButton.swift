//
//  EditButton.swift
//  Project Sunday 001 : Slack Profile
//
//  Created by Virata Yindeeyoungyeon on 3/26/17.
//  Copyright © 2017 ObjV. All rights reserved.
//

import UIKit

class EditButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }

}

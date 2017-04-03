//
//  InfoCell.swift
//  Project Sunday 001 : Slack Profile
//
//  Created by Virata Yindeeyoungyeon on 3/28/17.
//  Copyright © 2017 ObjV. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

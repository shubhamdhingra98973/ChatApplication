//
//  TableViewCellSenderImage.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 23/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class TableViewCellSenderImage: UITableViewCell {

    @IBOutlet weak var imgSent: UIImageView!

    @IBOutlet weak var imgProfile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgProfile.layer.masksToBounds = true
        imgProfile.layer.cornerRadius = 13.5
    }
}

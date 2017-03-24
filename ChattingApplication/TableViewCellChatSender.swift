//
//  TableViewCellChatSender.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 21/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class TableViewCellChatSender: UITableViewCell {

    @IBOutlet weak var lblMesaage: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
              viewContainer.layer.cornerRadius = 5
              imgProfile.layer.masksToBounds = true
              imgProfile.layer.cornerRadius = 13.5
    }
}

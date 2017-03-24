//
//  TableViewCellChatReciever.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 21/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class TableViewCellChatReciever: UITableViewCell {

    @IBOutlet weak var lblMesaage: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
      viewContainer.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

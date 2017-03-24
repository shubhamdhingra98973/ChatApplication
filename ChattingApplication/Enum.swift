//
//  Enum.swift
//  Clickat
//
//  Created by Sierra 4 on 15/03/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import Foundation
import UIKit

enum CoreDataEntities : String{
    case sender = "Sender"
    case Messages = "Messages"
    var id : String{
        return self.rawValue
    }
}
enum CoreDataAttributes : String{
    case sender_name = "sender_name"
    case sender_id = "sender_id"
    case messageId = "message_id"
    case messageData = "message_data"
    case messageType = "message_type"
    case receiverId = "receiver_id"
    var id  : String{
        return self.rawValue
    }
}
enum Identifiers : String{
    case identifierTableViewHome = "IdentifierTableCellHome"
    case identifiersegue =  "IdentifierSegueId"
    case identifierReceiver = "identifierReciever"
    case identifierReceiverImage = "identifierImageCellReciever"
    case identifierSender = "identifierSender"
    case identifierSenderImage = "identifierImageCellSender"
    var id : String{
        return self.rawValue
    }
}
    enum constants : String{
        case saved = "Saved"
        case name = "sapna"
        case error =  "There is some error "
        case results = "RESULTS"
        case blank = ""
        case delete = "Delete Sucessfully"
        var id:String{
            return self.rawValue
        }
}
enum alert : String{
    case title = "Alert"
    case des = " Do you want to send your current location ?"
    var id : String{
    return self.rawValue
    }
}
enum UrlConstant : String{
     case api = "AIzaSyDIcCCl49zCwGzF1jzE5rbPLYQ9BQL_9uc"
     case mapImageUrl = "https://maps.googleapis.com/maps/api/staticmap?center="
    case appendStr1 = "&zoom=18&size=600x300&markers="
    case appendstr2 = "&maptype=roadmap&key="
    case comma = ","
    var id : String{
        return self.rawValue
    }
}








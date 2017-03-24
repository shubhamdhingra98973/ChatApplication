//
//  Alert.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 23/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation
import UIKit
class Alert
{
      class func showAlert(Title : String , Des : String , obj : UIViewController, yes:@escaping () -> () , no:@escaping () -> ())
    {
        let alert = UIAlertController(title:Title, message:Des ,preferredStyle: .alert)
        obj.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Yes", style: .default,handler: { (action: UIAlertAction!) in
            yes()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel,handler: { (action: UIAlertAction!) in
            no()
        }))
        alert.view.tintColor = UIColor.brown  // change text color of the buttons
        alert.view.layer.cornerRadius = 25
        alert.view.backgroundColor = UIColor.white
    }
}

//
//  Intializer.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 23/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Intializer
{
    static var value:Int = 101
    static func increment() -> Int
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let senders = NSFetchRequest<NSFetchRequestResult>(entityName: CoreDataEntities.sender.id)
        var no_of_results:Int = 0
        let context = appDelegate.persistentContainer.viewContext
        senders.returnsObjectsAsFaults = false
        do
        {
        let results = try context.fetch(senders)
        no_of_results = results.count
        if results.count == 0
        {
            return value
        }
        
        }
        catch{
            print(constants.error.id)
        }
        return  (value + no_of_results)
    }
}

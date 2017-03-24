//
//  Senders.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 21/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import Foundation
import CoreData
import  UIKit

extension ViewController
{
     func DeleteAllData(){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: CoreDataEntities.sender.id))
            let DelAllReqVar1 = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: CoreDataEntities.Messages.id))
            do {
                try managedContext.execute(DelAllReqVar)
                try managedContext.execute(DelAllReqVar1)
            }
                catch {
                print(error)
            }
    }
 
    func saveSenders()
    {
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let IdValue = Intializer.increment()
        //code to save the data
        let senders = NSEntityDescription.insertNewObject(forEntityName: CoreDataEntities.sender.id, into: context)
        senders.setValue(self.addUser.text?.trimmingCharacters(in: .whitespaces) , forKey: CoreDataAttributes.sender_name.id)
        senders.setValue(IdValue, forKey: CoreDataAttributes.sender_id.id)
        do
        {
            try context.save()
            arrayName.append(addUser.text!.trimmingCharacters(in: .whitespaces))
            arrayId.append(IdValue)
        }
        catch
        {
            print(constants.error.id)
        }
    }
    
    func retrieveSenders()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let senders = NSFetchRequest<NSFetchRequestResult>(entityName: CoreDataEntities.sender.id)
        
        let context = appDelegate.persistentContainer.viewContext
        senders.returnsObjectsAsFaults = false
        do
        {
            let results = try context.fetch(senders)
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    if let sender_name = result.value(forKey: CoreDataAttributes.sender_name.id) as? String
                    {
                        arrayName.append(sender_name)
                        print(sender_name)
                        
                    }
                    if let sender_id = result.value(forKey: CoreDataAttributes.sender_id.id) as? Int
                    {
                        arrayId.append(sender_id)
                        print(sender_id)
                    }
                }
            }
        }
        catch
        {
            print(constants.error.id)
        }
    }
}

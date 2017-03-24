//
//  ExtensionViewControllerChat.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 21/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//


import Foundation
import UIKit
import CoreData
import Kingfisher
import AssetsLibrary
import Photos
import MobileCoreServices

extension ViewControllerChat:UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(false)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message_data_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(sender_id_array[indexPath.row] == Id ){
            print(msg_id_array)
            if(msg_id_array[indexPath.row] == 1){
                guard let cell:TableViewCellRecieverImage = tableView.dequeueReusableCell(withIdentifier: Identifiers.identifierReceiverImage.id, for: indexPath) as? TableViewCellRecieverImage
                    else{
                        return TableViewCellRecieverImage()
                }
                getUIImagefromAsseturl(url: URL(string:message_data_array[indexPath.row])!, completion: { (img) in
                    cell.imgSent.image = img
                })
                return cell
            }
            if(msg_id_array[indexPath.row] == 2){
                guard let cell:TableViewCellRecieverImage = tableView.dequeueReusableCell(withIdentifier: Identifiers.identifierReceiverImage.id, for: indexPath) as? TableViewCellRecieverImage
                    else{
                        return TableViewCellRecieverImage()
                }
                print("DATA",message_data_array[indexPath.row])
                cell.imgSent.kf.setImage(with:  URL(string:message_data_array[indexPath.row]))
                return cell
            }
            if(msg_id_array[indexPath.row] == 0){
                guard let cell:TableViewCellChatReciever = tableView.dequeueReusableCell(withIdentifier: Identifiers.identifierReceiver.id, for: indexPath) as? TableViewCellChatReciever else{ return TableViewCellChatReciever()}
                cell.lblMesaage.text = message_data_array[indexPath.row]
                return cell
            }
        }
        else {
            
            if(msg_id_array[indexPath.row] == 1){
                guard let cell:TableViewCellSenderImage = tableView.dequeueReusableCell(withIdentifier: Identifiers.identifierSenderImage.id, for: indexPath) as? TableViewCellSenderImage
                    else{
                        return TableViewCellSenderImage()
                }
                print("DATA",message_data_array[indexPath.row])
                getUIImagefromAsseturl(url: URL(string:message_data_array[indexPath.row])!, completion: { (img) in
                    cell.imgSent.image = img
                })
                return cell
            }
            if(msg_id_array[indexPath.row] == 2){
                guard let cell:TableViewCellSenderImage = tableView.dequeueReusableCell(withIdentifier: Identifiers.identifierSenderImage.id, for: indexPath) as? TableViewCellSenderImage
                    else{
                        return TableViewCellSenderImage()
                }
                cell.imgSent.kf.setImage(with:  URL(string:message_data_array[indexPath.row]))
                return cell
            }
            if(msg_id_array[indexPath.row] == 0){
                guard let cell:TableViewCellChatSender = tableView.dequeueReusableCell(withIdentifier: Identifiers.identifierSender.id, for: indexPath) as? TableViewCellChatSender else{ return TableViewCellChatSender()}
                cell.lblMesaage.text = message_data_array[indexPath.row]
                return cell
            }
        }
        return UITableViewCell()
    }
    func size(){
        if(tableView.frame.size.height >= viewBackTable.frame.size.height){
            self.tableViewHeight.constant = viewBackTable.frame.size.height
        }
        else {
            if(tableView.contentSize.height > viewBackTable.frame.size.height) {
                self.tableViewHeight.constant = viewBackTable.frame.size.height
            }
            else {
                self.tableViewHeight.constant = tableView.contentSize.height
            }
            self.view.layoutIfNeeded()
            self.tableView.layoutIfNeeded()
            self.tableView.layoutSubviews()
            self.view.layoutSubviews()
            
        }
        
        self.view.layoutIfNeeded()
        self.tableView.layoutIfNeeded()
        self.tableView.layoutSubviews()
        self.view.layoutSubviews()
    }
    
    func getUIImagefromAsseturl (url: URL, completion:@escaping (UIImage) -> ()) {
        
        let fetchResult = PHAsset.fetchAssets(withALAssetURLs: [url], options: nil)
        
        if let photo = fetchResult.firstObject {
            PHImageManager.default().requestImage(for: photo, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: nil) {
                image, info in
                completion(image!)
            }
        }
        
    }
    func tableViewScrollToBottom(animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(10)) {
            let numberOfSections = self.tableView.numberOfSections,
            numberOfRows = self.tableView.numberOfRows(inSection: numberOfSections-1)
            
            if numberOfRows > 0 {
                let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: animated)
            }
        }
    }
    
    func personSelector(obj : UISegmentedControl){
        if(obj.selectedSegmentIndex == 0)
        {
            sender_id = Id
            receiver_id = 201
        }
        else{
            sender_id = 201
            receiver_id = Id
        }
    }
    
    func imgSend(obj : UIButton)
    {
        let imgPicker = UIImagePickerController()
        //imgPicker.sourceType = .photoLibrary
        imgPicker.mediaTypes = [(kUTTypeMovie as String), (kUTTypeImage as String),(kUTTypeMovie as String)]
        imgPicker.delegate = self
        imgPicker.allowsEditing = true
        //imgPicker.sourceType = .photoLibrary
        self.present(imgPicker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let type = (info[UIImagePickerControllerMediaType] as! String)
        dismiss(animated:true, completion: nil)
        if (type == (kUTTypeImage as String)) {
            imageUrl = (info[UIImagePickerControllerReferenceURL]  as! URL)
            print("URL of Image Is",imageUrl!)
            url = (imageUrl?.absoluteString)!
        }
        else{
            if (type == (kUTTypeVideo as String)) || (type == (kUTTypeMovie as String)){
                VideoUrl = (info[UIImagePickerControllerMediaURL] as! URL)
                print("Url of Video is",VideoUrl!)
                url = (VideoUrl?.absoluteString)!
            }
        }
        if(url != nil){
            message_data_array.append(url)
            msg_id_array.append(1)
            sender_id_array.append(sender_id)
            saveMessages(url, msgId: 1)
            tableView.reloadData()
            tableViewScrollToBottom(animated: false)
        }
    }
    
    func DeleteAllData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: CoreDataEntities.Messages.id))
        do {
            try managedContext.execute(DelAllReqVar)
            print(constants.delete.id)
        }
        catch {
            print(error)
        }
    }
    
    func saveMessages(_ mymsg:String, msgId : Int)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //code to save the data
        let messages = NSEntityDescription.insertNewObject(forEntityName: CoreDataEntities.Messages.id, into: context)
        messages.setValue(msgId, forKey: CoreDataAttributes.messageId.id)
        messages.setValue(mymsg, forKey: CoreDataAttributes.messageData.id)
        messages.setValue(sender_id,forKey: CoreDataAttributes.sender_id.id)
        messages.setValue(receiver_id,forKey: CoreDataAttributes.receiverId.id)
        messages.setValue("text", forKey: CoreDataAttributes.messageType.id)
        do
        {
            try context.save()
            print(constants.saved.id)
        }
        catch
        {
            print(constants.error.id)
        }
    }
    
    func retrieveMessages()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let messages = NSFetchRequest<NSFetchRequestResult>(entityName: CoreDataEntities.Messages.id)
        
        let context = appDelegate.persistentContainer.viewContext
        messages.returnsObjectsAsFaults = false
        do
        {
            let results = try context.fetch(messages)
            print(constants.results.id,results.count)
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    let message = result.value(forKey: CoreDataAttributes.messageData.id) as? String
                    let fetch_sid = result.value(forKey: CoreDataAttributes.sender_id.id) as? Int
                    let fetch_rid = result.value(forKey: CoreDataAttributes.receiverId.id) as? Int
                    let fetch_msgid = result.value(forKey: CoreDataAttributes.messageId.id) as? Int
                    
                    if ((sender_id == fetch_sid &&  receiver_id == fetch_rid)
                        || (sender_id == fetch_rid &&  receiver_id == fetch_sid))
                    {
                        sender_id_array.append(fetch_sid!)
                        message_data_array.append(message!)
                        msg_id_array.append(fetch_msgid!)
                        print(fetch_sid ?? 0)
                    }
                }
            }
            print(sender_id_array)
            print(msg_id_array)
            print(message_data_array)
        }
        catch
        {
            print(constants.error.id)
        }
    }
    
}









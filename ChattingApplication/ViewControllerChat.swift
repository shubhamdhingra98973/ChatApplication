//
//  ViewControllerChat.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 21/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit
import ASJExpandableTextView
import AssetsLibrary
import CoreLocation
import MapKit


class ViewControllerChat: UIViewController{
    var message_data_array = [String]()
    var sender_id_array = [Int]()
    var sender_id = Int()
    var receiver_id : Int = 201
    var msgId = Int()
    var imageUrl : URL?
    var VideoUrl:URL?
    var msg_id_array = [Int]()
    var tempImage = UIImage()
    var url = String()
    var asset = ALAssetsLibrary()
    let api_key:String = UrlConstant.api.id
    let manager = CLLocationManager()
    var lat = String()
    var long = String()
    var heightTableView = CGFloat()
    @IBOutlet weak var tableViewTopConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var viewBackTable: UIView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!

    @IBOutlet weak var segPerson: UISegmentedControl!
    @IBOutlet weak var txtMessage: ASJExpandableTextView!
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnImagePicker: UIButton!
    @IBOutlet weak var btnVideoPicker: UIButton!
    @IBOutlet weak var btnLocationPicker: UIButton!

    var Id = Int()
    var name = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        sender_id = Id
     //     DeleteAllData()
          lblName.text = name
          segPerson.setTitle(name, forSegmentAt: 1)
          tableView.estimatedRowHeight = 60
          tableView.rowHeight = UITableViewAutomaticDimension
          tableViewScrollToBottom(animated: false)
          retrieveMessages()
          heightTableView = tableView.frame.height
    }
    override func viewDidAppear(_ animated: Bool) {
     size()
    }
    @IBAction func btnBack(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func segPerson(_ sender: UISegmentedControl) {
        personSelector(obj : sender)
    }
    @IBAction func btnImagePicker(_ sender: UIButton) {
       imgSend(obj: sender)
    }
    
    @IBAction func btnlocationload(_ sender: UIButton) {
        
        let fetchUrl = getURL()
        Alert.showAlert(Title: alert.title.id,Des: alert.des.id,obj: self,
         yes:{
            self.message_data_array.append(fetchUrl)
            self.sender_id_array.append(self.sender_id)
            self.msg_id_array.append(2)
            self.saveMessages(fetchUrl,msgId: 2)
            self.tableView.reloadData()
            self.tableViewScrollToBottom(animated: false)
        },no:{
            print(constants.error.id)
        })
    }
    
    @IBAction func VideoPicked(_ sender: UIButton) {
        imgSend(obj: sender)
    }
    
    @IBAction func btnSend(_ sender: UIButton) {
        if(!txtMessage.text.trimmingCharacters(in: .whitespaces).isEmpty){
            tableViewScrollToBottom(animated: false)
            message_data_array.append(((txtMessage.text)?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))!)
            sender_id_array.append(sender_id)
            msg_id_array.append(0)
            saveMessages(txtMessage.text!,msgId: 0)
            size()
            tableView.reloadData()
            txtMessage.text = constants.blank.id
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tableView.endEditing(false)
    }
}

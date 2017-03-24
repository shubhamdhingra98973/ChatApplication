//
//  ViewController.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 20/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController , UITextFieldDelegate{
    var arrayName = [String]()
    var arrayId = [Int]()
    var index = Int()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addUser: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
         // DeleteAllData()
           
         retrieveSenders()
    }
    @IBAction func btnAddUser(_ sender: UIButton) {
       if !(addUser.text?.isEmpty)!
        {
            saveSenders()
            tableView.reloadData()
            addUser.text = constants.blank.id
        }
        else{
            
            }
        }
}


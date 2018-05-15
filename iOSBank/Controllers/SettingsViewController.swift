//
//  SettingsViewController.swift
//  iOSBank
//
//  Created by Liv Souza on 12/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var currentUser = User.instance
    
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputLimit: UITextField!
    @IBOutlet weak var labelBalance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputName.text = currentUser.getUserName()
        inputLimit.text = String(currentUser.getLimit())
        labelBalance.text = String(currentUser.getBalance())
    }

    
    @IBAction func save(_ sender: UIButton) {
        if let inputLimit = inputLimit.text, let inputName = inputName.text {
            if (inputLimit == "" || Float(inputLimit) == 0) || inputName == ""  {
                let alert = UIAlertController(title: "Alert", message: "All fields required", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                    print("OK")
                }))
                
                self.present(alert, animated: true, completion: nil)
            } else if Float(inputLimit)! > currentUser.getBalance() {
                let alert = UIAlertController(title: "Alert", message: "New limit unavailable", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                    self.inputLimit.text = String(self.currentUser.getBalance())
                }))
                
                self.present(alert, animated: true, completion: nil)
            } else {
                currentUser.updateSettings(newName: inputName, newLimit: Float(inputLimit)!)
                
                let alert = UIAlertController(title: "Alert"
                    , message: "User updated"
                    , preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                    self.navigationController?.popViewController(animated: true)
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

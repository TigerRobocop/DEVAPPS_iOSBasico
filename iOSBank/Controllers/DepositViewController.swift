//
//  DepositViewController.swift
//  iOSBank
//
//  Created by Liv Souza on 12/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import UIKit

class DepositViewController: UIViewController {

    var currentUser = User.instance
    
    @IBOutlet weak var inputAmount: UITextField!
    @IBOutlet weak var labelBalance: UILabel!
    
    @IBAction func submit(_ sender: Any) {
        
        if let input = inputAmount.text {
            if input == "" || Float(input) == 0  {
                let alert = UIAlertController(title: "Alert", message: "Amount is required", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                    print("OK")
                }))
                
                self.present(alert, animated: true, completion: nil)
            } else {
                currentUser.deposit(amount: Float(input)!)
                
                let alert = UIAlertController(title: "Alert"
                    , message: input + " Deposit Successful!\nNew balance: " + String(currentUser.getBalance())
                    , preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                    self.navigationController?.popViewController(animated: true)
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelBalance.text = String(currentUser.getBalance())
    }


    
}


//let alert = UIAlertController(title: "OI", message: "teste de alert", preferredStyle: .actionSheet)
//
//alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
//    print("OK")
//}))
//alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(action) in
//    print("Cancel")
//}))
//
//alert.addAction(UIAlertAction(title: "Destroy", style: .destructive, handler: {(action) in
//    print("Destroy")
//}))
//
//present(alert, animated: true)


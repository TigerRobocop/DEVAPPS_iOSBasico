//
//  WithdrawalViewController.swift
//  iOSBank
//
//  Created by Aluno on 12/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import UIKit

class WithdrawalViewController: UIViewController {
    
    var currentUser = User.instance
    
    @IBOutlet weak var inputAmount: UITextField!
    @IBOutlet weak var labelBalance: UILabel!
    @IBOutlet weak var labelLimit: UILabel!
    
    @IBAction func submit(_ sender: UIButton) {
        
        if let input = inputAmount.text {
            if input.isEmpty || Float(input) == 0 {
                let alert = UIAlertController(title: "Alert", message: "Amount is required", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                    print("OK")
                }))
                self.present(alert, animated: true, completion: nil)
                
            } else if Float(input)! > currentUser.getLimit() {
                let alert = UIAlertController(title: "Alert", message: "Amount unavailable", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                    print("OK")
                }))
                self.present(alert, animated: true, completion: nil)
                
            } else {
                currentUser.withdrawal(amount: Float(input)!)
                
                let alert = UIAlertController(title: "Alert"
                    , message: input + " Withdrawal Successful!\nNew balance: " + String(currentUser.getBalance())
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
        labelLimit.text = String(currentUser.getLimit())
    }
}

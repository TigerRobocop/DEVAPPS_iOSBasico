//
//  LoginViewController.swift
//  iOSBank
//
//  Created by Liv Souza on 12/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var inputUserName: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationViewController = segue.destination as? MainViewController {
            destinationViewController.userName = inputUserName.text
            
            inputUserName.text = ""
            inputPassword.text = ""
        }
    }
}

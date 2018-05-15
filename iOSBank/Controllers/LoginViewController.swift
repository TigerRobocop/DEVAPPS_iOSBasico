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
        
        let login = User.instance.login(login: inputUserName.text!, pass: inputPassword.text!)
        
        if (login) {
            if let destinationViewController = segue.destination as? MainViewController {
                destinationViewController.userName = inputUserName.text
                
                inputUserName.text = ""
                inputPassword.text = ""
            }
        } else {
            let alert = UIAlertController(title: "Alert", message: "Login invalid", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                print("OK")
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}

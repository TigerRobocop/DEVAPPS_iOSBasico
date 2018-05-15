//
//  MainViewController.swift
//  iOSBank
//
//  Created by Liv  on 12/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var userName: String?
    //var currentUser: User?
    var currentUser = User.instance
    
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelBalance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
           self.navigationController!.navigationBar.topItem!.title = "Logout"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.isHidden = false
        
//        if userName != nil {
//            currentUser.userName = userName!
//        }
       
        labelUserName?.text = currentUser.getUserName()
        labelBalance?.text = String(currentUser.getBalance())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "OI", message: "teste de alert", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
            print("OK")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(action) in
            print("Cancel")
        }))
        
        alert.addAction(UIAlertAction(title: "Destroy", style: .destructive, handler: {(action) in
            print("Destroy")
        }))
        
        present(alert, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

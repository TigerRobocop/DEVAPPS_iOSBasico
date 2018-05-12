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
    
    @IBOutlet weak var labelUserName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelUserName.text = userName
        
        
        self.navigationController!.navigationBar.topItem!.title = "Logout"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

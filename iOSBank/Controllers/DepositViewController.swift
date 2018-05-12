//
//  DepositViewController.swift
//  iOSBank
//
//  Created by Aluno on 12/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import UIKit

class DepositViewController: UIViewController {

    @IBOutlet weak var inputAmount: UITextField!
    
    @IBAction func submit(_ sender: Any) {
        var result = getBalance()
    }
    
    
    //    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.navigationController!.navigationBar.topItem!.title = "Cancel"
//    }

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

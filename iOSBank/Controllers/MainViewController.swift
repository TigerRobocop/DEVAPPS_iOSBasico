//
//  MainViewController.swift
//  iOSBank
//
//  Created by Liv  on 12/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var userName: String?
    //var currentUser: User?
    var currentUser = User.instance
    
    @IBOutlet weak var tansactionsTableView: UITableView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelBalance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.topItem!.title = "Logout"
        tansactionsTableView.dataSource = self
        tansactionsTableView.delegate = self
        self.view.addSubview(tansactionsTableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.isHidden = false
        
        labelUserName?.text = currentUser.getUserName()
        labelBalance?.text = String(currentUser.getBalance())
        self.tansactionsTableView.reloadData()
    }



    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Transactions"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentUser.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transaction_cell", for: indexPath)
        
        let transaction = currentUser.transactions[indexPath.row] //.get(at: indexPath.row)
        cell.textLabel?.text = transaction.transactionType
        cell.detailTextLabel?.text = String(transaction.amount)
        //cell.imageView?.image = #imageLiteral(resourceName: "hangloose")
        
        return cell
    }
    
//    lazy var refreshControl: UIRefreshControl = {
//        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action:
//            #selector(MainViewController.handleRefresh(_:)),
//                                 for: UIControlEvents.valueChanged)
//        refreshControl.tintColor = UIColor.red
//
//        return refreshControl
//    }()
//
//
//    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
//
////        let newHotel = Hotels(name: "Montage Laguna Beach", place:
////            "California south")
////        hotels.append(newHotel)
////
////        hotels.sort() { $0.name < $0.place }
//
//        self.tansactionsTableView.reloadData()
//        refreshControl.endRefreshing()
//    }
//
//    self.tansactionsTableView.addSubview(self.refreshControl)
    
}

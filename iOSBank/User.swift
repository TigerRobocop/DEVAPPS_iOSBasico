//
//  User.swift
//  iOSBank
//
//  Created by Liv Souza on 12/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import Foundation

class User
{
    private static var singleton: User?
    
    static var instance: User {
        get {
            if singleton == nil {
                singleton = User()
            }
            return singleton!
        }
    }
    
    var userLogin: String = "liv"
    var userPassword: String = "123"
    var userName: String = "Liv Souza"
    var balance: Float
    var limit: Float
    var transactions = [Transaction]()
    
    init() {
        self.balance = 2000
        self.limit = 500
    }
    
    func getUserName() -> String { return self.userName }
    func getUserLogin() -> String { return self.userLogin }
    func getUserPassword() -> String { return self.userPassword }
    
    func getBalance() -> Float { return self.balance }
    func getLimit() -> Float {
        if self.balance < self.limit { return self.balance }
        else { return self.limit }
    }
    
    
    func deposit(amount: Float) {
        self.balance = self.balance + amount
        let transaction = Transaction(amount: amount, transactionType: "deposit")
        self.transactions.append(transaction)
    }
    
    func withdrawal(amount: Float) {
        self.balance = self.balance - amount
        let transaction = Transaction(amount: amount, transactionType: "withdrawal")
        self.transactions.append(transaction)
    }
   
    func updateSettings (newName: String, newLimit: Float) {
        self.userName = newName
        self.limit = newLimit
    }
    
    func login (login: String, pass: String) -> Bool {
        return login == self.userLogin && pass == self.userPassword
    }
    
//    var listOfStrings = ["Rainbow", "Banana", "Social"]
//
//
//
//    func size() -> Int {
//        return listOfStrings.count
//    }
//
//    func insert(value: String) {
//        listOfStrings.append(value)
//    }
//
//    func remove(at index: Int) -> String {
//        return listOfStrings.remove(at: index)
//    }
//
//    func get (at index: Int) -> String {
//        return listOfStrings[index]
//    }
}

struct Transaction {
    
    var id: Int
    var transactionType: String
    var amount: Float
    
    static var lastId = 0
    
    static func getNextId() -> Int {
        lastId += 1
        return lastId
    }
    
    init (amount: Float, transactionType: String) {
        self.id = Transaction.getNextId()
        self.amount = amount
        self.transactionType = transactionType
    }
}
